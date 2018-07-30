library(shiny)
shinyUI(
  navbarPage(
    # un css externe
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.min.css"),
      # et une modification du titre
      tags$style(HTML("
      @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
      h1 {
        font-family: 'Lobster', cursive;
        font-weight: 500;
        line-height: 1.1;
        color: #BDBDBD;
      }
    "))
    ),
    tabPanel(
      title = "Tab 1",
      sidebarLayout(
        sidebarPanel(
          sliderInput("bins", "Number of bins:", min = 1, max = 50, value = 30),
          radioButtons(inputId = "col", label = "Choose a color", inline = TRUE,
                       choices = c("red", "blue", "darkgrey"), selected = "blue"),
          actionButton("go_graph", "Update !")
        ),
        mainPanel(
          # h1("Title H1 Histogram"),
          h1("Title H1 Histogram with css color in element", style = "color: #FF0000;"), plotOutput("distPlot"))
      )
    )
  ))