# Define server logic required to draw a histogram
function(input, output) {
   
  # renderPlot <- renderPlotly
  output$distPlot <- renderPlotly({

    # generate bins based on input$bins from ui.R
    x    <- iris[, input$var]
    bins <- round(seq(min(x), max(x), length.out = input$bins + 1), 2)

    # use plot_ly
    plot_ly(x = x, type = "histogram", nbinsx = bins, color = I(input$color)) %>%
      layout(title = input$titre)
  })
  
  # renderPlot <- renderPlotly
  output$boxplot <- renderPlotly({
    x <- iris[, input$var]
    plot_ly(y = ~x, x=~Species, type = "box", data = iris, color = I(input$color), name = input$var, boxmean = "sd") %>%
      layout(title = list(text = "Boxplot", font = list(color = "orange", size = 18)))
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
