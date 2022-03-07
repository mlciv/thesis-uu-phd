(TeX-add-style-hook
 "misc-analysis"
 (lambda ()
   (TeX-run-style-hooks
    "chapters/sentence/label_confusion"
    "chapters/sentence/context_attention_ablation"
    "chapters/sentence/good_MI")
   (LaTeX-add-labels
    "sec:snt:analysis"))
 :latex)

