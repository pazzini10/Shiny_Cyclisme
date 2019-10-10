fluidPage(
  fluidRow(leafletOutput("country_map"),
           DT::dataTableOutput("tabl_map")))