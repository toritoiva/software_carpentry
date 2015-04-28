rm(list=ls())
gapminder <- read.csv("C:/Users/Clau/Desktop/scws/data/gapminder.csv")
#creating functions.
#converting F to Celsius
f2c <- 
  function(fahr){
    ((fahr-32)*5/9)
  }
#converting C to K
f2c_and_k <- 
  function(fahr){
    cel <- (fahr-32)*5/9
    kel <- cel+273.15
    c(celsius=cel,kelvin=kel)
  }

fc2f <- 
  function(cel){
    ((cel*9/5)+32)
  }
###########################################################################
#plot gdpPercap vs lifeExp data for one year

plot_year <- 
  function(year, data=gapminder)
  {
    the_year <- year ####to avoid issue at filtering: year==year
      
      library(dplyr)
      library(ggplot2)
    
      data %>%
      filter(year==the_year) %>%
      ggplot(aes(y=lifeExp,x=gdpPercap,color=continent))+
      geom_point()+
      scale_x_log10()
  }

###########################################################################
#plot for one country and over the years

plot_country <- 
  function(country, data=gapminder)
  {
    library(dplyr)
    library(ggplot2)
   
    the_country <- country
    
      data %>%
      filter(country==the_country) %>%
      ggplot(aes(y=lifeExp,x=gdpPercap))+
      geom_point()+
      scale_x_log10()+
      facet_grid(~year)
  }
############################################################################

