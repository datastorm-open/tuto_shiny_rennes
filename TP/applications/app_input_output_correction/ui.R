library(shiny)
library(colourpicker)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Premiers pas avec shiny"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30),
       
       # input pour la couleur
       colourInput(inputId = "color", label = "Couleur :", value = "purple"),
       
       # titre du graphique
       textInput(inputId = "titre", label = "Titre :", value = "Histogramme"),
       
       # selection de la colonne
       radioButtons(inputId = "var", label = "Variable : ", choices = colnames(faithful)),
       
       # bouton de telechargement du graphique
       downloadLink('download_plot', 'Télécharger le graphique')
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       # classes (div centrée)
       div(textOutput("n_bins"), align = "center"),
       # trait horizontal
       tags$hr(),
       # summary
       verbatimTextOutput("summary"),
       # table
       dataTableOutput("table")
    )
  )
))
