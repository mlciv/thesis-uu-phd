(TeX-add-style-hook
 "experiments"
 (lambda ()
   (TeX-run-style-hooks
    "sentence/misc-preprocessing"
    "sentence/misc-main-results")
   (LaTeX-add-labels
    "sec:misc:experiments"))
 :latex)

