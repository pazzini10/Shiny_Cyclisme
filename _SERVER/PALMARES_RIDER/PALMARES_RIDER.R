

output$palmares_rider <- DT::renderDataTable(
  DT::datatable({
  base_top_rider %>% arrange(desc(nb_vict_class))
    
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

