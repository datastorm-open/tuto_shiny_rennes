# Define server logic required to draw a histogram
function(input, output, session) {
  
  # partage du vecteur entre les outpus en
  data <- reactive({
    iris[, input$var] 
  })
  
  # renderPlot <- renderPlotly
  output$distPlot <- renderPlotly({
    input$go # input declenchant la reactivite
    # reste du code isole
    isolate({
      # generate bins based on input$bins from ui.R
      x    <- data()
      bins <- round(seq(min(x), max(x), length.out = input$bins + 1), 2)

      # use amHist
      plot_ly(x = x, type = "histogram", nbinsx = bins, color = I(input$color)) %>%
        layout(title = input$titre)
    })
  })
  
  # renderPlot <- renderPlotly
  output$boxplot <- renderPlotly({
    input$go # input declenchant la reactivite
    # reste du code isole
    isolate({
      x <-  data()
      plot_ly(y = ~x, x=~Species, type = "box", data = iris, color = I(input$color), name = input$var, boxmean = "sd") %>%
        layout(title = list(text = "Boxplot", font = list(color = "orange", size = 18)))
    })
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
  
  # passage automatique a l'onglet histo
  observeEvent(input$go, {
    updateTabsetPanel(session, inputId = "viz", selected = "Histogramme")
  })
  
}
