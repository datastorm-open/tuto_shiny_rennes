# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  # partage du vecteur entre les outpus en
  data <- reactive({
    faithful[, input$var] 
  })
  
  # renderPlot <- renderAmCharts
  output$distPlot <- renderAmCharts({
    input$go # input declenchant la reactivite
    # reste du code isole
    isolate({
      # generate bins based on input$bins from ui.R
      x    <- data()
      bins <- round(seq(min(x), max(x), length.out = input$bins + 1), 2)
      
      # use amHist
      amHist(x = x, control_hist = list(breaks = bins), 
             col = input$color, main = input$titre, 
             export = TRUE, zoom = TRUE)
    })
  })
  
  # renderPlot <- renderAmCharts
  output$boxplot <- renderAmCharts({
    input$go # input declenchant la reactivite
    # reste du code isole
    isolate({
      x <-  data()
      amBoxplot(x, col = input$color, main = "Boxplot", export = TRUE, zoom = TRUE)
    })
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
  
  # passage automatique a l'onglet histo
  observeEvent(input$go, {
    updateTabsetPanel(session, inputId = "viz", selected = "Histogramme")
  })
  
})
