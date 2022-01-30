library(ggthemes)
library(tidyverse)
library(ggplot2)
library(plotly)
library(shiny)

ui <- fluidPage(
  titlePanel("Base de dados de Planetas"),
  sidebarLayout(
    sidebarPanel(
      
    ),
    mainPanel(
      dataTableOutput("planetas")
    )
  )
)

server <- function (input, output, session){
  output$planetas <- renderDataTable({
    data
  })
}

shinyApp(ui, server)