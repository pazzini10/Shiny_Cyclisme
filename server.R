shinyServer(function(input, output, session) {

  ## KPI ##
  
source("./_SERVER/RIDERS/RIDERS.R",local = TRUE,encoding = "UTF-8")
source("./_SERVER/NEAREST_RIDER/NEAREST_RIDER.R",local = TRUE,encoding = "UTF-8")
source("./_SERVER/PALMARES_RIDER/PALMARES_RIDER.R",local = TRUE,encoding = "UTF-8")

 
})









 