(TeX-add-style-hook
 "analysis"
 (lambda ()
   (TeX-run-style-hooks
    "label_confusion"
    "context_attention_ablation"
    "good_MI")
   (LaTeX-add-labels
    "sec:snt:analysis"))
 :latex)

