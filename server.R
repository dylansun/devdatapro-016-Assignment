
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
shinyServer(function(input, output) {  
  model <- reactive({
    input$train
    isolate({
      predictors <- input$predictors
      sub_mtcars <- mtcars[,c("mpg", predictors)]
      lm(mpg ~ ., data=sub_mtcars)
    })
  })
  
  output$plot <- renderPlot({
    par(mfrow=c(2,2))
    plot(model())
  })
  output$summary <- renderPrint({
    summary(model())
  })
  
})
