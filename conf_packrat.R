# library(packrat)
# library(devtools)
# # packrat::set_opts(symlink.system.packages = F)
# # packrat::set_opts(local.repos = '/Library/Frameworks/R.framework/Versions/3.5/Resources/library/')
# 
# #packrat::init(getwd(),options = list(local.repos = "/Library/Frameworks/R.framework/Versions/3.5/Resources/library/"))
#  
# setwd('/home/dflouriot/Documents/R/Shiny_Cyclisme')
# #packrat::set_opts(external.packages = c("devtools"))
# install.packages("devtools",lib='/usr/local/lib/R/site-library/')
# packrat::on(project = '/home/dflouriot/Documents/R/Shiny_Cyclisme')
# packrat::snapshot() 
# packrat::restore() 
# #packrat::opts$ignored.packages(c(""))
# #remove.packages("xtable")
# packrat::clean()
# packrat::status()
# packrat::off()
# packrat::clean(packages = 'devtools',force = TRUE)
# unlink("home/dflouriot/Documents/R/Shiny_Cyclisme/packrat/lib-R", recursive = TRUE)
# install.packages("devtools")
# # #Mettre à jour les packages ajoutés ou supprimés
# # packrat::snapshot(lib.loc = '/Users/dflouriot/R/Shiny_Cyclisme/packrat/lib/x86_64-apple-darwin15.6.0/3.5.1/')
# # #Vérifier si tous les packages ont été chargés
# # packrat::status()
# # #Nettoyer les packages inutiles
# # packrat::clean()
# # #Pour transporter un projet
# # packrat::bundle()
# # 
# # #Automatique packrat à jour
# # packrat::set_opts(auto.snapshot = TRUE)
# # 
# # .libPaths()
# # # packrat::opts$local.repos()
# # # packrat::opts$local.repos(NULL)
# # # packrat:::libDir() <- setdiff(packrat:::libDir(), 'BH')
# # # packrat:::libDir()  
# # # packrat::off()
