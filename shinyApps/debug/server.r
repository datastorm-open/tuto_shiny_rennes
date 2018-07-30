library(shiny)
data(iris)

# # open browser on error
# options(shiny.error = browser)
# # options(shiny.error = NULL)
# 
# # enabled reactlog
 # options(shiny.reactlog =TRUE)
# 
# # view all communication between client and server
# options(shiny.trace = FALSE)
# 
# # full trace on error
# options(shiny.fullstacktrace = TRUE)
# 
# # shiny::runApp("shinyApps/debug", display.mode="showcase")


shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    if(input$go_graph > 0){
      isolate({
        x <- iris[, input$variable]
        
        # a print to console, visibled also in shiny-server logs
        # cat(file=stderr(), class(x), "\n")
        
        # launch browser
        # browser()
        
        # launch shiny.reactlog
        # showReactLog()
        
        hist(x)
      }) 
    }
  })
})