library(shiny)

## define UI for dataset viewer application

fluidPage(
  
  ##Application title
  titlePanel("shiny text"),
  
  # sidebar with controls to selet a dataset and specify the
  # number of observations to view
  
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "select a dataset:",
                  choice = c("rock", "pressure", "cars")),
      
      numericInput("obs", "Number of observations to view", 10),
      
      selectInput("test", "select the month",
                  choice = c("Jan", "Feb", "Mar"))
    ),
    
    
    ## show a summary of the dataset and an HTML table with the
    ## requested number of observations
    mainPanel(
      verbatimTextOutput("Summary"),
      tableOutput("view"),
      plotOutput("myplot")
    )
  )
  
  
)