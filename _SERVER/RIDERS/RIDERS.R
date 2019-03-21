
tt=
output$classement <- DT::renderDataTable(
  DT::datatable({
    subset( final_riders, select = -c(id_rider,ok,pts,DP,RS,jour_naissance,team_spirit,exp_level) )
   
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
  
   %>% 
  formatStyle(
    c('CL','DH','HL','SP','FR','CB','TT','TQ'),
     
    Color = styleInterval(c(50,60,70,80,90), c('black','bisque','lightgreen','chartreuse','green','darkgreen'))
  )
 %>%
  formatCurrency("value", digits = 0)
)
  
