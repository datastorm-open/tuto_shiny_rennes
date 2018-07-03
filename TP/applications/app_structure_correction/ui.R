#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  # navbarPage
  navbarPage("Old Faithful Geyser Data",
             
             # premier onglet Data
             tabPanel("Data", 
                      navlistPanel(
                        widths = c(2, 10), 
                        tabPanel("Table", dataTableOutput("table")),
                        tabPanel("Summary",verbatimTextOutput("summary"))
                      )
             ), 
             
             # second onglet Visualisation
             tabPanel("Visualisation", 
                      
                      fluidRow(
                        # premier colonne
                        column(width = 3, 
                               # wellPanel pour griser
                               wellPanel(
                                 sliderInput("bins",
                                             "Number of bins:",
                                             min = 1,
                                             max = 50,
                                             value = 30),
                                 
                                 # input pour la couleur
                                 selectInput(inputId = "color", label = "Couleur :",
                                             choices = c("Rouge" = "red", "Vert" = "green", "Bleu" = "blue")),
                                 
                                 # titre du graphique
                                 textInput(inputId = "titre", label = "Titre :", value = "Histogramme"),
                                 
                                 # selection de la colonne
                                 radioButtons(inputId = "var", label = "Variable : ", choices = colnames(faithful))
                               )
                        ), 
                        # deuxieme colonne
                        column(width = 9, 
                               tabsetPanel(
                                 tabPanel("Histogramme", 
                                          plotOutput("distPlot"),
                                          # classes (div centrée)
                                          div(textOutput("n_bins"), align = "center")
                                 ),
                                 tabPanel("Boxplot", plotOutput("boxplot"))
                               )
                        )
                      )
             )
  )
)