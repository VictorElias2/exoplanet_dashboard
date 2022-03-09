library(ggthemes)
library(tidyverse)
library(ggplot2)
library(plotly)
library(shiny)

ui <- fluidPage(
  titlePanel("Base de dados de Planetas"),
  sidebarLayout(
    sidebarPanel(
      tags$img(src = "terra.png", width = "100%"),
      width = 3,
      # Adicionar uma imagem de algum planeta no futuro.
      sliderInput("year_slider", "Ano", value = 2020,
                  min = min(unique(data$descoberto)),
                  max = max(unique(data$descoberto))),
      # Desenvolvimento no futuro
      # selectInput("select_colum", "Select a Colum (SOON)", 
      #             choices = c("Selecionar", names(data))),
      selectInput("select_molecule", "Select a planet with molecule",
                  choices = c("Selecionar", levels(data$moleculas)))),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Tabela",
                 dataTableOutput("planetas")
        ),
        tabPanel("Plot",
                 plotOutput("plot_planets")
        )
      )
    )
  )
)

server <- function (input, output, session){
  source("includes/1_data_planets.R", local = T)
  source("includes/2_plot_planets.R", local = T)
}

shinyApp(ui, server)
