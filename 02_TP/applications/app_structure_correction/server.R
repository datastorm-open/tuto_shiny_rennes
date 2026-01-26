library(shiny)

# Define server logic required to draw a histogram
function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- iris[, input$var] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = input$color, border = 'white', main = input$titre)
    
  })
  
  # rajout du boxplot
  output$boxplot <- renderPlot({
    x <- iris[, input$var] 
    boxplot(x, col = input$color, main = "Boxplot")
  })
  
  # summary
  output$summary <- renderPrint({
    summary(iris)
  })
  
  # table
  output$table <- DT::renderDT({
    iris
  })
  
  # nombre de classe
  output$n_bins <- renderText({
    paste("Nombre de classes : ", input$bins)
  })
  
}
