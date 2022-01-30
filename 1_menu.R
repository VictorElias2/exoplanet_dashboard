library(ggthemes)
library(tidyverse)
library(ggplot2)
library(plotly)
library(shiny)

ui <- fluidPage(
  titlePanel("Base de dados de Planetas"),
  sidebarLayout(
    sidebarPanel(
      # Adicionar uma imagem de algum planeta no futuro.
      sliderInput("mass_slider", "Massa", value = min(unique(data$massa)),
                  min = min(unique(data$massa)),
                  max = max(unique(data$massa)))
    ),
    mainPanel(
      dataTableOutput("planetas")
    )
  )
)

server <- function (input, output, session){
  output$planetas <- renderDataTable({
    data %>% 
      filter(massa == input$mass_slider)
  })
}

shinyApp(ui, server)