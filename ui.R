
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Old Faithful Geyser Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),
      selectInput("dataset", "Choose a dataset:", 
                  choices = c("rock", "pressure", "cars")),
      
      numericInput("obs", "Number of observations to view:", 10),
      
      # Simple integer interval
      sliderInput("integer", "Integer:", 
                  min=0, max=1000, value=500),
      
      # Decimal interval with step value
      sliderInput("decimal", "Decimal:", 
                  min = 0, max = 1, value = 0.5, step= 0.1),
      
      # Specification of range within an interval
      sliderInput("range", "Range:",
                  min = 1, max = 1000, value = c(200,500)),
      
      # Provide a custom currency format for value display, with basic animation
      sliderInput("format", "Custom Format:", 
                  min = 0, max = 10000, value = 0, step = 2500,
                  format="$#,##0", locale="us", animate=TRUE),
      
      # Animation with custom interval (in ms) to control speed, plus looping
      sliderInput("animation", "Looping Animation:", 1, 2000, 1, step = 10, 
                  animate=animationOptions(interval=300, loop=T))
      
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      verbatimTextOutput("summary"),
      tableOutput("view"),
      tableOutput("values")
    )
  )
))
