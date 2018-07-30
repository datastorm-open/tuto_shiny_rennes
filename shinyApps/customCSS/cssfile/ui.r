library(shiny)
shinyUI(
  # fluidPage(theme = "bootstrap.min.css",
  navbarPage(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.min.css")
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
        mainPanel(h1("Title H1 Histogram"), plotOutput("distPlot"))
      )
    )
  ))