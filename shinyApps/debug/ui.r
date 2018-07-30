library(shiny)
data(iris)
shinyUI(
  fluidPage(
    fluidRow(
      column(3,
             wellPanel(
               selectInput("variable", "Choose a variable :", choices = colnames(iris)),
               actionButton("go_graph", "Update !")
             )
             
      ),
      column(9,
             plotOutput("distPlot")
      )
    )
  ))