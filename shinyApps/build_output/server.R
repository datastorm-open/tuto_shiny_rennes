shinyServer(function(input, output, session) {
  
  output$mylinechart <- renderLineChart({
    data.frame(x = 1:100, y = rnorm(1:100))
  })
  
})