#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
function(input, output) {
   
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, input$sel_col] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = input$color, border = 'white',
         main = input$hist_title)
    
    # add some text
    output$summary <- renderPrint({
      summary(faithful)
    })
    
    # add some table
    output$my_dt <- DT::renderDT({
      faithful
    })
    
    # add number of bins
    output$nb_bins <- renderText({
      paste0("Le nombre de bins est : ", input$bins)
    })
  })
}
