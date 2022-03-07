(TeX-add-style-hook
 "chap2"
 (lambda ()
   (TeX-run-style-hooks
    "chapters/background/bg-symbolic-rep"
    "chapters/background/bg-summary")
   (LaTeX-add-index-entries
    "gnu"
    "gnu!diet"
    "gnu!diet!wet season"
    "gnu!diet!dry season"
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
    "Alces alces@\\bioname{Alces alces}"
    "Antilocapra americana@\\bioname{Antilocapra americana}"
    "Marmota marmota@\\bioname{Marmota marmota}"))
 :latex)
