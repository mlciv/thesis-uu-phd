### ====================================================================
### Makefile for University of Utah Sample Thesis 2.  This file differs
### from that for Sample Thesis 1 in its TEXFILES value, and a more
### complex bbl target that creates bibliographies for each chapter
### and appendix that has its own bibliography style command.
###
### Current target list:
###	all			make .dvi file
###	aux			make .aux file
###	bbl			make .bbl file
###	check			doubled-word, spelling, and syntax checks
###	clean			remove intermediate automatically-created
###				files
###	clobber			same as distclean
###	distclean		remove most automatically-created files
###	dvi			make .dvi file
###	dw			make double-word check
###	FRC			dummy target
###	install			install files on system (dummy target)
###	maintainer-clean	remove absolutely everything that make can
###				build
###	mostlyclean		same as clean
###	pdf			make PDF file(s)
###	ps			make PostScript file(s)
###	spell			make spelling check
###	thesis			same as thesis.dvi
###	thesis.aux
###	thesis.dvi
###	thesis.bbl
###	thesis.pdf
###	thesis.ps
###	thesis.toc
###	uninstall		uninstall installed files (dummy target)
###
### [16-Mar-2016] -- update for TeX Live and default of PDF output
### [28-May-2001] -- update for LaTeX2e
### [06-Jul-1993]
### ====================================================================

BIBTEX          = bibtex

CAT		= /bin/cat

CP		= /bin/cp -p

DETEX           = detex -n

### Use whichever of these you have:
DISTILL		= distill
DISTILL		= ps2pdf

### The dvips-type1 script is a local wrapper that ensures that Type 1
### outline fonts are used, instead of bitmap fonts, because Acrobat
### Reader does a poor job of displaying the latter.
DVIPS		= dvips-type1
DVIPS		= dvips

### dw is available at ftp://ftp.math.utah.edu/pub/misc/dw.tar.gz
DW		= dw

### Filter to tweak .idx file entries.  Usually, this would be
### a sed script, but for now, it is just a dummy that copies
### its input to its output without changes
FIXIDX		= $(SED) -e 's/\[-\]/-/g' -e 's/\\ / /g'
FIXIDX		= $(CAT)

FGREP		= fgrep

LACHECK		= lacheck

### Many sites call this latex, with the old 2.09 version available as
### latex209, or not at all.  At the University of Utah Mathematics
### department, latex is always 2.09, and latex2e is 2e.
LATEX           = latex2e

### TeX Live name
LATEX           = latex

MAKEINDEX	= makeindex

MAKEINDEXFLAGS	= -c

MV		= /bin/mv

### TeX Live name
PDFLATEX	= pdflatex

RM              = rm -f

SED             = sed

SHELL		= /bin/sh

### We used to use "spell +file.sok" on Sun Solaris, but GNU/Linux
### systems use a different syntax for that command.  Instead, we use
### another spelling program, with the -l option to list spelling
### exceptions, and later below, with the "-p $(THESIS).sok" option to
### supply a private dictionary for this student thesis.
SPELL		= hunspell -l

TOUCH		= touch

TRUE		= true

### ====================================================================
### Personal files to be updated for each student.  It is CRITICAL that
### these lists be complete, because they are dependencies on which
### correct typesetting depends.  If a dependent file is missing here,
### then a change to that file would not cause typesetting to be done
### on the next "make" command!

EPSFILES	= fig1.eps			\
		  fig2.eps 			\
		  fig3.eps

FIGFILES	= fig1.tex			\
		  fig2.tex 			\
		  fig3.tex

PDFFILES	= fig1.pdf			\
		  fig2.pdf 			\
		  fig3.pdf

STYFILES	= amssymb.sty			\
		  amssymbols.sty		\
		  diagram.sty			\
		  dissertationapproval.sty	\
		  lamsarrow.sty			\
		  mythesis.sty			\
		  rgb.sty			\
		  tgrind.sty			\
		  uuthesis-2016-h.sty		\
		  uuthesis-chapterbib.sty	\
		  uuthesis-color-headings.sty	\
		  uuthesis-index.sty

TEXFILES        = abstract.tex			\
		  acknowledge.tex		\
		  chap1.tex			\
		  chap2.tex			\
		  chap3.tex			\
		  chap4.tex			\
		  chap5.tex			\
		  chap6.tex			\
		  chap7.tex			\
		  appa.tex			\
		  appb.tex			\
		  appc.tex			\
		  notation.tex

THESIS		= thesis-main

TOPFILE		= $(THESIS).ltx

.SUFFIXES:

### ====================================================================

### all:	dvi
all:	pdf

aux:	$(THESIS).aux

### In the event of chapter bibliographies (required for theses that
### include other documents), we also need to run BibTeX on each
### auxiliary file that contains a \bibstyle command.  The simplest
### solution is to loop over the required *.aux files, and test
### their contents.
### OLD: bbl:
### OLD:	-$(BIBTEX) $(THESIS)
bbl:
	-for f in $(TEXFILES:.tex=) $(THESIS) ;					\
	do									\
	    echo ========== $$f ;						\
	    $(FGREP) -s '\bibstyle' $$f.aux >/dev/null && $(BIBTEX) $$f ;	\
	done || $(TRUE)

bbl-ind-toc:
	-$(MAKE) bbl
	-$(MAKE) indexes
	-$(MAKE) toc

check:	 dw spell syntax-check

clean:
	-$(RM) *.blg
	-$(RM) *.dvi*
	-$(RM) *.dw
	-$(RM) *.ilg
	-$(RM) *.log
	-$(RM) *.o
	-$(RM) *.ser
	-$(RM) *.tmp
	-$(RM) *.old
	-$(RM) *~
	-$(RM) \#*
	-$(RM) core

clobber:	distclean

distclean:	mostlyclean
	-$(RM) *.aux
	-$(RM) *.bbl
	-$(RM) *.idx
	-$(RM) *.ind
	-$(RM) *.toc
	-$(RM) *.lof
	-$(RM) *.lot

dvi:	$(THESIS).dvi

### NB: Because we do "\input{}" on the extra indexes, they MUST exist:
### create empty files if they do not.
dvi-pass:
	test -f $(THESIS)-bioname.ind || $(TOUCH) $(THESIS)-bioname.ind
	test -f $(THESIS)-fsfname.ind || $(TOUCH) $(THESIS)-fsfname.ind
	-$(LATEX) $(THESIS).ltx
	-$(MAKE) bbl-ind-toc

dw:
	-$(RM) $(THESIS).dw
	@echo '==================== doubled words ===================='
	for f in $(TEXFILES) $(TOPFILE) ; 		\
	do						\
		echo ===== $$f ===== ;			\
		echo ===== $$f ===== >> $(THESIS).dw ;	\
		$(DETEX) $$f  | $(DW) >> $(THESIS).dw ; \
	done

### dummy target for force make to make a rule
FRC:

indexes:	$(THESIS).ind $(THESIS)-bioname.ind $(THESIS)-fsfname.ind

install:
	@echo There is nothing to install for this package

maintainer-clean:	distclean
	@echo "This command is intended for maintainers to use;"
	@echo "it deletes files that may require special tools to rebuild."
	-$(RM) $(THESIS).pdf $(THESIS).ps

mostlyclean:	clean

### NB: Because we do "\input{}" on the extra indexes, they MUST exist:
### create empty files if they do not.
pdf-pass:
	test -f $(THESIS)-bioname.ind || $(TOUCH) $(THESIS)-bioname.ind
	test -f $(THESIS)-fsfname.ind || $(TOUCH) $(THESIS)-fsfname.ind
	-$(PDFLATEX) $(THESIS).ltx
	-$(MAKE) bbl-ind-toc

pdf:	$(THESIS).pdf

ps:	$(THESIS).ps

spell:	$(TEXFILES) $(TOPFILE)
	-if [ ! -f $(THESIS).sok ] ; then touch $(THESIS).sok ; fi
	@echo '==================== spelling exceptions ===================='
	for f in $(TEXFILES) $(TOPFILE) ;						\
	do								\
		echo ===== $$f ===== ;					\
		g=`basename $$f .tex` ;					\
		$(DETEX) $$f  | $(SPELL) -p $(THESIS).sok > $$g.ser;	\
		if [ -s $$g.ser ] ;					\
		then cat $$g.ser ;					\
		else $(RM) $$g.ser ;					\
		fi ;							\
	done

syntax-check:
	$(LACHECK) $(THESIS).ltx

thesis:	$(THESIS).pdf

toc:	$(THESIS).toc

$(THESIS).aux:
	-if [ ! -f $(THESIS).aux ] ; then touch $(THESIS).aux ; fi

### NB: Because of extensive cross-referencing in the thesis, and in
### the bibliography entries, we need FOUR complete passes to reach
### consistency!
$(THESIS).dvi:	Makefile $(THESIS).bbl $(EPSFILES) $(FIGFILES) $(STYFILES) $(TEXFILES) $(TOPFILE)
	-$(MAKE) dvi-pass
	-$(MAKE) dvi-pass
	-$(MAKE) dvi-pass
	-$(MAKE) dvi-pass

### Rigorously, the .bbl file also depends on the .aux file, but
### because that gets created anew each LaTeX run, a dependency on the
### .aux file causes $(THESIS).dvi or $(THESIS).pdf to be remade
### unnecessarily, so we suppress that dependency.
### $(THESIS).bbl:	$(THESIS).bib $(THESIS).aux

$(THESIS).bbl:	$(THESIS).bib proposal.bib sp.bib psyc.bib top.bib semi-top.bib mrp.bib sdp.bib ucca.bib amr.bib ltg.bib sgd.bib scalable-dialog.bib
### $(THESIS).bbl:	$(THESIS).bib
	-$(MAKE) $(THESIS).aux
	-$(BIBTEX) $(THESIS)

### NB: We remove the fsfname entries from the topic index, but leave
### the bioname ones!
$(THESIS).ind:	FRC $(THESIS).idx $(THESIS).ist
	$(MV) $(THESIS).idx $(THESIS).idx.old
	$(FIXIDX) < $(THESIS).idx.old > $(THESIS).idx
	-$(FGREP) -v fsfname $(THESIS).idx | $(MAKEINDEX) $(MAKEINDEXFLAGS) -s $(THESIS).ist > $@

### NB: Because of extensive cross-referencing in the thesis, and in
### the bibliography entries, we need FOUR complete passes to reach
### consistency!
$(THESIS).pdf:	Makefile $(THESIS).bbl $(FIGFILES) $(PDFFILES) $(STYFILES) $(TEXFILES) $(TOPFILE)
	-$(MAKE) pdf-pass
	-$(MAKE) pdf-pass
	-$(MAKE) pdf-pass
	-$(MAKE) pdf-pass

$(THESIS).ps:	$(THESIS).dvi
	$(DVIPS) -o $@ $?

### This will strip the sections from appearing in the table of contents.
# $(THESIS).toc:	FRC
$(THESIS).toc:
#	$(CP) $(THESIS).toc $(THESIS).toc.old
#	$(SED) '/[AB]\.[12]/d' <$(THESIS).toc.old >$(THESIS).toc

$(THESIS)-fsfname.ind:	FRC
	-$(FGREP) fsfname $(THESIS).idx | $(FGREP) -v '|see' | $(MAKEINDEX) -c -s $(THESIS).ist > $@

$(THESIS)-bioname.ind:	FRC
	-$(FGREP) bioname $(THESIS).idx | $(FGREP) -v '|see' | $(MAKEINDEX) -c -s $(THESIS).ist > $@

uninstall:
	@echo There is nothing to uninstall for this package

2:
	-$(MAKE) pdf-pass
	-$(MAKE) pdf-pass
