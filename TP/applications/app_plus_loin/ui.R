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
                        tabPanel("Table", 
                                 # titre avec css
                                 h1("Jeu de données", style = "color : #0099ff;text-align:center"),
                                 # table
                                 dataTableOutput("table")),
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
                                 radioButtons(inputId = "var", label = "Variable : ", choices = colnames(faithful)),
                                 
                                 # bouton
                                 actionButton("go", "GO!!!")
                               )
                        ), 
                        # deuxieme colonne
                        column(width = 9, 
                               tabsetPanel(id = "viz", 
                                 tabPanel("Histogramme", 
                                          # plotOutput -> amChartsOutput
                                          amChartsOutput("distPlot"),
                                          # classes (div centrée)
                                          div(textOutput("n_bins"), align = "center")
                                 ),
                                 tabPanel("Boxplot", amChartsOutput("boxplot"))
                               )
                        )
                      )
             ),
             # onglet sur la societe
             tabPanel("About",
                      # rajout d'une image avec img()
                      # elle doit etre dans www
                      img(src = "img/DATASTORM-GENES.jpg", width = 200),
                      tags$hr(),
                      "En tant que filiale du GENES, ", 
                      a(href = "www.datastorm.fr", "DATASTORM"), 
                      " valorise l’ensemble des 
                      activités de recherche du Groupe auprès des entreprises et administrations."
             )
  )
)