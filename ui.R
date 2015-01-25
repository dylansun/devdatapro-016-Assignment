
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(markdown)

data(mtcars)
choices_list <- names(mtcars)[-1]
names(choices_list) <- c("Number of cylinders",
                        "Displacement",
                        "Gross horsepower",
                        "Rear axle ratio",
                        "Weight",
                        "1/4 mile time",
                        "V/Straight",
                        "Transmission",
                        "Number of forward gears",
                        "Number of carburetors")
shinyUI(fluidPage(

  # Application title
  titlePanel("Miles per gallon peridiction"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      
      checkboxGroupInput("predictors", label = h4("Features"), 
                         choices = choices_list,
                         selected = "cyl"),
      actionButton("train", "Train Model")
    ),
      
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("plot")), 
        tabPanel("Summary", verbatimTextOutput("summary")), 
        tabPanel("Document", includeMarkdown("README.md"))
      )
    )
  )
))
