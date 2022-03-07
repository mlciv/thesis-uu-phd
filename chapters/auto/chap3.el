(TeX-add-style-hook
 "chap3"
 (lambda ()
   (setq TeX-command-extra-options
         "---shell-escape")
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "SaveVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "VerbatimOut")
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb")
   (TeX-run-style-hooks
    "chapters/lexical/lex-intro"
    "chapters/lexical/lex-anchor-analysis"
    "chapters/lexical/lex-graph-based"
    "chapters/lexical/latent-alignment"
    "chapters/lexical/lex-exp"
    "chapters/lexical/lex-related-work"
    "chapters/lexical/lex-conclusion")
   (LaTeX-add-index-entries
    "gnu"
    "gnu!diet"
    "gnu!diet!wet season"
    "gnu!diet!dry season"
    "gnu!predators"
    "gnu!predators!crocodiles"
    "gnu!predators!hyenas"
    "gnu!predators!lions"
    "rhinodon"
    "rhinodont"
    "rhinoceros"
    "rhinoceros horn"
    "rhinocerite"
    "rhinestone"
    "Rhineland"
    "Rhinegrave"
    "Rhine berry"
    "rhea"
    "rat"
    "raccoon"
    "Queensland viper"
    "quail"
    "quagga"
    "puffin"
    "pterodactyl"
    "pronghorn (\\bioname{Antilocapra americana})"
    "peccary"
    "panther"
    "panda"
    "opossum"
    "okapi"
    "octopus"
    "ocelot (\\bioname{Leopardus pardalis})"
    "nilgai"
    "Neanderthal"
    "nautilus"
    "narwhal"
    "muskrat"
    "musk ox"
    "moose (\\bioname{Alces alces})"
    "mastodon"
    "mastiff"
    "marmot (\\bioname{Marmota marmota})"
    "margay (\\bioname{Leopardus wiedii})"
    "manatee (\\bioname{Trichechus inunguis})"
    "mammoth"
    "lynx (\\bioname{Lynx canadensis})"
    "llama (\\bioname{Lama glama})"
    "lion"
    "leopard"
    "lemur"
    "lemming"
    "kudu"
    "kangaroo"
    "koala"
    "jerboa"
    "jaguar (\\bioname{Panthera onca})"
    "jackrabbit"
    "jackass"
    "jackal"
    "impala"
    "ibex"
    "hyena"
    "hippopotamus"
    "hartebeest"
    "giraffe"
    "gila monster"
    "gecko"
    "gazelle"
    "fox"
    "ferret"
    "elk (\\bioname{Cervus canadensis})"
    "elephant"
    "deer"
    "crocodile"
    "coyote"
    "cougar (\\bioname{Puma concolor})"
    "cheetah"
    "caribou"
    "bongo (\\bioname{Tragelaphus eurycerus})"
    "bobcat (\\bioname{Lynx rufus})"
    "bison"
    "beaver"
    "azymous (unleavened)"
    "aoudad"
    "antelope"
    "addax"
    "aardwolf"
    "aardvark"
    "Alces alces@\\bioname{Alces alces}"
    "Antilocapra americana@\\bioname{Antilocapra americana}"
    "Cervus canadensis@\\bioname{Cervus canadensis}"
    "Lama glama@\\bioname{Lama glama}"
    "Lynx canadensis@\\bioname{Lynx canadensis}"
    "Marmota marmota@\\bioname{Marmota marmota}"
    "Panthera onca@\\bioname{Panthera onca}"
    "Tragelaphus eurycerus@\\bioname{Tragelaphus eurycerus}"))
 :latex)

