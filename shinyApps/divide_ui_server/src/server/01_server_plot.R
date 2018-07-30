output$plot <- renderPlot({
  plot(iris$Sepal.Length, iris$Sepal.Width)
})
