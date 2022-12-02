library(shiny)
library(tidyverse)
library(plotly)

# ui to be usde in shiny app
ui <- navbarPage(
  "Project",
  intro,
  plotpage
)

# Introduction page
intro <- tabPanel(
  "Introduction",
  titlePanel("CO2 Data Analysis of the World"),
  p("Climate Change exists to be a nuisance to our world.
    Carbon dioxide (CO2) is one of the main ways in which our world is being destroyed in its
    environments. In maintaining the quality of our atmosphere, we first
    need to pay attention to our contributions to the matter. In this application,
    we will explore specific patterns in CO2 emissions worldwide."
    ),
   p("In this application, we will specifically be searching through the amount
     of CO2 produced by",
     strong("coal,"),
     strong("oil,"),
     strong("gas,"),
     strong("land use changes,"),
     " and the overall amount of CO2 produced accumatively.",
     strong("Coal, gas, and oil"),
     "are common fuel sources used for powering machinery, which produces
     CO2 emissions when burned/exhausted.",
     strong("Land use changes"),
     "describes the amount of CO2 produced when transforming land,
     which usually follows with the destruction of greenspace. Alongside all
     of these individual counts follows the accumlative number of CO2 emissioned of the presented
     timeline in years. All of these values are measured in millions of tonness."),
  p("There are a lot of valuable information that can be found from studying these
    datasets, such as the total amount of CO2 emissions from coal equating to",
    strong(coal_co2_total),
    "million tonnes, the average amount of CO2 caused by oil consumption in the United States equaling",
    strong(oil_co2_us_ave),
    "million tonnes, and the amount of CO2 emissions between 2000 and 2021 worldwide summing up to an increase of",
    strong(cumulative_co2_world_diff),
    "million tonnes."
    )
)

# Plot Page

plotpage <- tabPanel(
  "Plot Summary",
  titlePanel("Visualization of CO2 Emissions"),
  sidebarLayout(
    sidebarPanel(
      selectInput("emission", "Type of CO2 Emission Data Worldwide",
                  choices = c("coal_co2", "oil_co2", "gas_co2", "land_use_change_co2",
                              "cumulative_co2")),
      sliderInput("year", "Year Range", min = min_year, max = max(max_year),
                  value = c(2000, 2020))
    ),
    mainPanel(
      plotlyOutput("emission_graph")
    )
  )
)
