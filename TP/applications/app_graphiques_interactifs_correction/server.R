# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  # renderPlot <- renderAmCharts
  output$distPlot <- renderAmCharts({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, input$var] 
    bins <- round(seq(min(x), max(x), length.out = input$bins + 1), 2)
    
    # use amHist
    amHist(x = x, control_hist = list(breaks = bins), 
           col = input$color, main = input$titre, 
           export = TRUE, zoom = TRUE)
  })
  
  # renderPlot <- renderAmCharts
  output$boxplot <- renderAmCharts({
    x <- faithful[, input$var] 
    amBoxplot(x, col = input$color, main = "Boxplot", export = TRUE, zoom = TRUE)
  })
  
  # summary
  output$summary <- renderPrint({
    summary(faithful)
  })
  
  # table
  output$table <- renderDataTable({
    faithful
  })
  
  # nombre de classe
  output$n_bins <- renderText({
    paste("Nombre de classes : ", input$bins)
  })
  
})
