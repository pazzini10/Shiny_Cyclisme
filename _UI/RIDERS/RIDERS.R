fluidPage(
  fluidRow(tags$head(tags$style(HTML( '.has-feedback .form-control { padding-right: 0px;}' ))), DT::dataTableOutput("classement")))