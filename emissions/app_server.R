library(tidyverse)
library(shiny)

df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

# gathers CO2 by coal, land use, and oil for each country from the year 2000 and beyond
# also gathers cummulative co2 for comparison, all measured in million tonnes
df_2 <- df %>% 
  select(country, year, coal_co2, land_use_change_co2, oil_co2, cumulative_co2, gas_co2) %>% 
  filter(year >= 2000)

# worldwide data
df_3 <- df %>% 
  select(country, year, coal_co2, land_use_change_co2, oil_co2, cumulative_co2, gas_co2) %>% 
  filter(country == "World") %>% 
  filter(!is.na(coal_co2) & !is.na(oil_co2) & !is.na(land_use_change_co2) &
           !is.na(cumulative_co2) & !is.na(gas_co2))

# values to be used for slider inputs
min_year <- df_3 %>% 
  filter(year == min(year)) %>% 
  pull(year)

max_year <- df_3 %>% 
  filter(year == max(year)) %>% 
  pull(year)

# grabs the amount of co2 produced from coal of the whole world
coal_co2_total <- df_2 %>% 
  filter(year == max(year), country == "World") %>% 
  pull(coal_co2) %>% 
  floor() %>% 
  prettyNum(big.mark = ",", scientific = F)

# difference of the cumulative co2 between 2000-latest in the world
cumulative_co2_world_diff <- df_2 %>% 
  filter(country == "World") %>% 
  summarise(diff = max(cumulative_co2) - min(cumulative_co2)) %>% 
  pull(diff) %>% 
  floor() %>%  
  prettyNum(big.mark = ",", scientific = F)

# the amount of oil produced in the United States on average 2000-latest
oil_co2_us_ave <- df_2 %>% 
  select(country, year, oil_co2) %>% 
  filter(country == "United States") %>% 
  summarise(oil_ave = mean(oil_co2)) %>% 
  pull(oil_ave) %>% 
  floor() %>% 
  prettyNum(big.mark = ",", scientific = F)

# server

server <- function(input, output) {
    # Create plotly bar graph
    output$emission_graph <- renderPlotly({
      
    
    })
}
