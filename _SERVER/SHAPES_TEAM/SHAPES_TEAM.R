
compt_pays=pays %>%
  group_by(country) %>%
  summarise(nb_team=n())



map_countries@data=map_countries@data %>%
  mutate(COUNTRY=trimws(sapply(strsplit(as.character(COUNTRY), "\\("), function(x) x[1]))) %>%
  mutate(COUNTRY=ifelse(COUNTRY=='United States','USA',COUNTRY)) %>%
  left_join(compt_pays %>% rename(COUNTRY=country),by='COUNTRY') %>%
  left_join(pays %>% filter(class_pays==1) %>% select(team,nb_pts,country) %>% rename(COUNTRY=country) ,by='COUNTRY')

coord_pays=NULL
for (i in 1:length(map_countries$COUNTRY)) {
  
  temp=map_countries@polygons[[i]]@labpt 
  coord_pays=rbind(coord_pays,temp)
}
coord_pays = coord_pays %>%
  as.data.frame() %>%
  rename(lng=V1,lat=V2) 

map_countries@data=map_countries@data %>%
  cbind(coord_pays)


label <- paste(
  "<bold> Country : <bold/> ", map_countries$COUNTRY, "<br/>", 
  "Nb teams : ", map_countries$nb_team, "<br/>","Best Team : ",map_countries$team ," / ",map_countries$nb_pts," pts",sep="") %>%
  lapply(htmltools::HTML)


output$country_map=renderLeaflet(
  leaflet(map_countries) %>% addTiles() %>%
    addCircleMarkers(label = label,lat= ~ lat,lng= ~ lng,radius = ~ sqrt(nb_team*7),stroke = FALSE, fillOpacity = 0.5)
  
  
)



output$tabl_map <-
  DT::renderDataTable(
    DT::datatable({
      map_countries@data %>%
        select(COUNTRY,nb_team,team,nb_pts) %>%
        arrange(desc(nb_team)) %>%
        rename("Nb teams"=nb_team,"Best Team"=team,"Nb pts"=nb_pts) 
        
      
    }
    ,extensions = c(
      #"FixedColumns", 
      "FixedHeader", 
      "Scroller",
      "ColReorder",
      "Buttons"), options = list(
        columnDefs = list(list(className = 'dt-center',targets="_all")),
        #scroller = TRUE,
        colReorder = TRUE,
        scrollX = TRUE,
        initComplete = JS(
          "function(settings, json) {",
          "$(this.api().table().header()).css({'background-color': 'rgba(255, 255, 128, .5)', 'color': 'hsl(50, 33%, 25%)'});",
          "}"),
        autoWidth = TRUE,
        dom = 'BClfrtip',
        
        buttons = c(I('colvis'), 'csv', 'pdf'),
        #scrollY = 200,
        #fixedHeader = TRUE,
        #class = 'cell-border stripe',
        # fixedColumns = list(
        #   leftColumns = 2,
        #   heightMatch = 'none'
        # ),
        paging = TRUE ,orderClasses = TRUE),rownames= FALSE, filter = list(position = 'top'))
    
    
    
  )
