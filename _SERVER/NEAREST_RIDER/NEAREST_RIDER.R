
output$ch_rider <-renderUI({
  selectizeInput("Value_ch_rider",
              "Select one rider to compare",
              choices = unique(paste0(final_riders$nom_prenom," (",final_riders$team,")")) ,selected = 1 )})




select_rider=function(i){
#i="Denniz Dixen (tomba)"
  dist_riders_final=matrix(0,nrow=NROW(final_riders),ncol=1)
  sselect=as.data.frame(final_riders[which(paste0(final_riders$nom_prenom," (",final_riders$team,")")==i),c('CL','DH','HL','SP','FR','CB','TQ','TT')])
  
  for (j in 1:NROW(final_riders)) {
    
    dist_riders=as.numeric(dist(rbind(as.matrix(final_riders[j,c('CL','DH','HL','SP','FR','CB','TQ','TT')]),sselect)))
    dist_riders_final[j,1]=dist_riders[1]
  }
  
  dist_riders_final1=cbind(final_riders,as.data.frame(dist_riders_final))
  
  
  dist_riders_final1=dist_riders_final1 %>%
    arrange(V1) %>%
    select(-c(V1,id_rider,ok,pts,DP,RS,jour_naissance,team_spirit,exp_level)) %>%
    slice(1:250)
  
  return(dist_riders_final1)
}
#select_rider("Denniz Dixen (tomba)")
 
  output$final_riders_select <-
  DT::renderDataTable(
    DT::datatable({
      select_rider(input$Value_ch_rider)
      
    }
    ,extensions = c(
      #"FixedColumns", 
      "FixedHeader", 
      "Scroller",
      "Buttons"), options = list(
        columnDefs = list(list(className = 'dt-center',targets="_all")),
        #scroller = TRUE,
        scrollX = TRUE,
        initComplete = JS(
          "function(settings, json) {",
          "$(this.api().table().header()).css({'background-color': 'rgba(255, 255, 128, .5)', 'color': 'hsl(50, 33%, 25%)'});",
          "}"),
        autoWidth = TRUE,
        dom = 'BClfrtip',
        ordering=FALSE,
        buttons = c(I('colvis'), 'csv', 'pdf'),
        #scrollY = 200,
        #fixedHeader = TRUE,
        #class = 'cell-border stripe',
        # fixedColumns = list(
        #   leftColumns = 2,
        #   heightMatch = 'none'
        # ),
        paging = TRUE ,orderClasses = FALSE),rownames= FALSE)
    
    %>% 
      formatStyle(
        c('CL','DH','HL','SP','FR','CB','TT','TQ'),
        
        Color = styleInterval(c(50,60,70,80,90), c('black','bisque','lightgreen','chartreuse','green','darkgreen'))
      )
    %>%
      formatCurrency("value", digits = 0)
  )
  #