library(shiny)
library(leaflet)

navbarPage("PMM", id="nav",
           
           tabPanel("Interactive map",
                    div(class="outer",
                        
                        tags$head(
                          # Include our custom CSS
                          includeCSS("styles.css"),
                          includeScript("gomap.js")
                        ),
                        
                        leafletOutput("mymap", width="100%", height="850px"),
                        
                        absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                                      draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
                                      width = 330, height = "auto",
                                      
                                      h2("Select Metrics type"),
                                      
                                      radioButtons("radio_metric_select","Select Metric", c("Impressions" = "impressions", "Clicks" = "clicks", "Both"='both'))
                        )
                    )
           ),
           
           tabPanel("Mass2 Channel Data"),
           
           conditionalPanel("false", icon("crosshair"))
)
