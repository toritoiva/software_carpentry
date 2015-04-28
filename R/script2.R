rm(list=ls())
gapminder <- read.csv("C:/Users/Clau/Desktop/scws/data/gapminder.csv")

#load my home-made functions for my analysis
source("C:/Users/Clau/Desktop/scws/R/funct.R")

#plot a year

plot_year(1952)

#only Asia

gm_asia <- gapminder %>%
  filter(continent=="Asia")

plot_year(1952, gm_asia)

#challenge
plot_country("Chile")

