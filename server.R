library(shiny)
library(leaflet)
library(htmltools)

source('global.R')

shinyServer(function(input, output, session) {
  
  output$mymap <- renderLeaflet({
    
    getColor <- function(data) {
      sapply(data$zip_code, function(zip) {
        if(zip <= 30000) {
          "green"
        } else if(zip <= 60000) {
          "orange"
        } else {
          "red"
        } })
    }
    
    icons <- awesomeIcons(
      icon = 'ios-close',
      iconColor = 'black',
      library = 'ion',
      markerColor = getColor(station_data)
    )
    
    leaflet(data = station_data) %>% addTiles(urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
                           attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>') %>% setView(lng = -95.6500523, lat = 39.850033, zoom=5) %>% addAwesomeMarkers(station_data$longitude, station_data$latitude, icon=icons, label = ~htmlEscape(station_data$city), clusterOptions = markerClusterOptions())
  })
  
})
