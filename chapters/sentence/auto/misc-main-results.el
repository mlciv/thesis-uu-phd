(TeX-add-style-hook
 "misc-main-results"
 (lambda ()
   (TeX-run-style-hooks
    "sentence/misc-best-model")
   (LaTeX-add-labels
    "tbl:main_rst_c_categorizing"
    "tbl:main_rst_t_categorizing"
    "tbl:main_rst_forecast"))
 :latex)

