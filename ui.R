

# Define UI for dataset viewer application
## Définition de l'interface utilisateur de notre application

shinyUI(#fluidPage(
  #theme = shinytheme("cosmo"),
  
  
  
  dashboardPage(
    #skin = "navy",#crée une page dashboard
    
    dashboardHeader(title = span(img(
      src = "logo.png",
      height = 60,
      width = 80
    ))),
    dashboardSidebar(collapsed=TRUE,
      #barre latérale du dashboard
      
      sidebarMenu(
        #sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
        #                 label = "Search..."),
        menuItem(
          "Riders",
          tabName = "RIDERS",
          icon = icon("address-card")
        
        
      ),
      menuItem(
        "Nearest Riders",
        tabName = "NEAREST_RIDER",
        icon = icon("address-card")
        
        
      ),
      menuItem(
        "Palmares Riders",
        tabName = "PALMARES_RIDER",
        icon = icon("address-card")
        
        
      )
    )
    ),
    
    dashboardBody(
      #corps principal
      
      tabItems(
        #crée un conteneur pour les éléments de l'onglet
        tabItem(
          "RIDERS",
          source("./_UI/RIDERS/RIDERS.R")$value
        ),
        tabItem(
          "NEAREST_RIDER",
          source("./_UI/NEAREST_RIDER/NEAREST_RIDER.R")$value
        ),
        tabItem(
          "PALMARES_RIDER",
          source("./_UI/PALMARES_RIDER/PALMARES_RIDER.R")$value
        )
        
        

        
       
        
      )
      
    )

))
    
  
