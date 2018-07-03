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
                      # table
                      dataTableOutput("table"),
                      # summary
                      verbatimTextOutput("summary")
             ), 
             
             # second onglet Visualisation
             tabPanel("Visualisation", 
                      
                      # Sidebar with a slider input for number of bins 
                      sidebarLayout(
                        sidebarPanel(
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
                        ),
                        
                        # Show a plot of the generated distribution
                        mainPanel(
                          plotOutput("distPlot"),
                          # classes (div centrée)
                          div(textOutput("n_bins"), align = "center")
                        )
                      )
             )
  )
)
