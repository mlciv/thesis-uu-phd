(TeX-add-style-hook
 "chap6"
 (lambda ()
   (TeX-run-style-hooks
    "chapters/sgd/sgd-intro"
    "chapters/sgd/sgd-challenges"
    "chapters/sgd/sgd-datasets"
    "chapters/sgd/sgd-models"
    "chapters/sgd/sgd-sup-training"
    "chapters/sgd/schema-description"
    "chpaters/sgd/sgd-related-work"
    "chapters/sgd/sgd-conclusion")
   (LaTeX-add-labels
    "chaper:sgd"))
 :latex)

