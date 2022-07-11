server <- function(input, output) {
  
  # call the server part
  # check_credentials returns a function to authenticate users
  res_auth <- secure_server(
    check_credentials = check_credentials(credentials)
  )
  
  output$auth_output <- renderPrint({
    reactiveValuesToList(res_auth)
  })
  
  #PLANO DE EXPANSÃO - LEAFLET ----
  
  output$mapa_agencias = renderLeaflet({
    m=leaflet() %>%
      addTiles() %>%  # Add default OpenStreetMap map tiles
      addMarkers(lng=agencias_rio_verde$longitude, lat=agencias_rio_verde$latitude, label = paste(agencias_rio_verde$Cooperativa, '-', agencias_rio_verde$Tipo, sep = ' '))
    if(input$metros == 500){
      m %>% addCircles(lng=agencias_rio_verde$longitude, lat=agencias_rio_verde$latitude, radius = 500, color = agencias_rio_verde$color)
    }else if(input$metros == 1000){
      m %>% addCircles(lng=agencias_rio_verde$longitude, lat=agencias_rio_verde$latitude, radius = 1000, color = agencias_rio_verde$color)
    }else if(input$metros == 1500){
      m %>% addCircles(lng=agencias_rio_verde$longitude, lat=agencias_rio_verde$latitude, radius = 1500, color = agencias_rio_verde$color)
    }else{
      m %>% addCircles(lng=agencias_rio_verde$longitude, lat=agencias_rio_verde$latitude, radius = 2000, color = agencias_rio_verde$color)
    }
    
  })
  
  output$mapa_leads = renderLeaflet({
    m=leaflet() %>% 
      addTiles() %>% 
      addMarkers(lng = as.numeric(leads$Longitude), lat = as.numeric(leads$Latitude), label = paste(leads$Empresa, leads$Segmento, leads$Telefone, sep = ". "))
    m
  })
  
  output$leads_excel = renderDataTable({
    leads_ref = leads
    leads_ref$url = NULL; leads_ref$Latitude = NULL; leads_ref$Longitude = NULL
    
    datatable( data = leads_ref
               , extensions = 'Buttons'
               , options = list( 
                 dom = "Blfrtip"
                 , buttons = 
                   list("copy", list(
                     extend = "collection"
                     , buttons = c("csv", "excel", "pdf")
                     , text = "Download"
                   ) ) # end of buttons customization
                 
                 # customize the length menu
                 , lengthMenu = list( c(10, 20, -1) # declare values
                                      , c(10, 20, "All") # declare titles
                 ) # end of lengthMenu customization
                 , pageLength = 10
                 
                 
               ) # end of options
               
    ) # end of datatables
      
    
  })
  

}
