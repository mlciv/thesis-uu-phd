(TeX-add-style-hook
 "misc-devices"
 (lambda ()
   (TeX-run-style-hooks
    "misc/misc-dial-rep"
    "misc/misc-word-att"
    "misc/misc-snt-att"
    "misc/misc-pred-training"
    "misc/misc-focal-loss")
   (LaTeX-add-labels
    "sec:devices"))
 :latex)

