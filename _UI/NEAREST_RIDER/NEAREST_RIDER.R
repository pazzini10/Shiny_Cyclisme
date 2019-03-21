fluidPage(
  fluidRow(tags$head(tags$style(HTML( '.has-feedback .form-control { padding-right: 0px;}' ))),
           column(1,textAreaInput("CL", "CL", "50", width = "50px")),
           column(1,textAreaInput("DH", "DH", "50", width = "50px")),
           column(1,textAreaInput("HL", "HL", "50", width = "50px")),
           column(1,textAreaInput("SP", "SP", "50", width = "50px")),
           column(1,textAreaInput("FR", "FR", "50", width = "50px")),
           column(1,textAreaInput("CB", "CB", "50", width = "50px")),
           column(1,textAreaInput("TT", "TT", "50", width = "50px")),
           column(1,textAreaInput("TQ", "TQ", "50", width = "50px")),
           column(1,"",actionButton("do", "Compare")),
             
           uiOutput("ch_rider"),
    
    DT::dataTableOutput("final_riders_select") )
)