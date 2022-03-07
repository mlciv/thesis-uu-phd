(TeX-add-style-hook
 "misc-experiments"
 (lambda ()
   (TeX-run-style-hooks
    "sentence/misc-preprocessing"
    "sentence/misc-main-results")
   (LaTeX-add-labels
    "sec:snt:experiments"))
 :latex)

