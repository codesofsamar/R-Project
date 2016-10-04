library(shiny)
library(datasets)
library(ggplot2)
source("plot_func.R")


## --------------------------######---------------------------------------##

function(input, output) {
  # return the requested dataset
  
  datasetInput <- reactive({
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  })
  
##--------------------------######---------------------------------------------##
## You can put in your helper functions here
  plot_func <- function(xyz) {
    if(input$dataset == "cars")  {
      ggplot(cars, aes(x = speed, y = dist)) + geom_line()
    } else if(input$dataset == "pressure" ) {
      ggplot(pressure, aes(x = pressure, y = temperature)) + geom_line()
    } else if(input$dataset == "rock") {
      ggplot(rock, aes(x = peri, y = area, color = shape)) + geom_line()
    }
  }
  ##---------------------------#####---------------------------------------------##
  
  
  ## generate a summary of the dataset
  output$Summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  ## show the first "n" observations
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
  ## plots some plot that i added extra
  output$myplot <- renderPlot({
    plot_func()
  }
    
  )
}


