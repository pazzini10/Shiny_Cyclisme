library(packrat)
# packrat::set_opts(symlink.system.packages = F)
# packrat::set_opts(local.repos = '/Library/Frameworks/R.framework/Versions/3.5/Resources/library/')
setwd('/Users/dflouriot/R/Cyclisme/Shiny/TDB_OCM/')
packrat::init(getwd(),options = list(local.repos = "/Library/Frameworks/R.framework/Versions/3.5/Resources/library/"))
 

packrat::on(project = '/Users/dflouriot/R/Cyclisme/Shiny/TDB_OCM/',auto.snapshot = T )

 
#remove.packages("xtable")

#Mettre à jour les packages ajoutés ou supprimés
packrat::snapshot(lib.loc = '/Users/dflouriot/R/Cyclisme/Shiny/TDB_OCM/packrat/lib/x86_64-apple-darwin15.6.0/3.5.1/')
#Vérifier si tous les packages ont été chargés
packrat::status()
#Nettoyer les packages inutiles
packrat::clean()
#Pour transporter un projet
packrat::bundle()

#Automatique packrat à jour
packrat::set_opts(auto.snapshot = TRUE)


# packrat::opts$local.repos()
# packrat::opts$local.repos(NULL)
# packrat:::libDir() <- setdiff(packrat:::libDir(), 'BH')
# packrat:::libDir()  
# packrat::off()
