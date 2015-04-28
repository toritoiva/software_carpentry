x<-8
x*3
y <- x/2
x <- 15
ls()
#shortcut for arrow: Alt+-
weights <- c(50,60,65,82)
weights
animals <- c("mouse","rat","dog")
animals
length(weights)
class(weights)
class(animals)
str(animals)
str(weights)
weights <- c(weights, 90)
weights
weights <- c(30,weights)
weights
#challenge
z <- c(x,y,weights)
z
length(z)
mean(z)
#Data
getwd()
list.files()
#move into different directory: setwd("~/Desktop or any other path")
gapminder <- read.csv("gapminder.csv")
#head: to see first few rows of data
head(gapminder)
head(gapminder,3) #to see a different number of rows
class(gapminder)
str(gapminder)
#Challenge: First line of output gives all the info: columns are the number of variables, in this case 6. Rows are observations, in this case 1704.
#factor is a variable with text, non-numeric variable

#R indexing starts with 1, not 0 like other languages
weights[1]
weights[1:3]
#first row, first column
gapminder[1,1]
#500th row and columns 5 and 6
gapminder[500,5:6]
#a whole column, not specific rows
gapminder$pop
#equivalent to specify a column
gapminder[,5]
gapminder[,"pop"]
#all of the data for Finland
gapminder[gapminder$country=="Finland",]
#countries and years where pop<=100000
gapminder[gapminder$pop<=100000,c(1:3)]
#another syntax
gapminder[gapminder$pop<=100000,c("country","year")]
head(gapminder)
#challenge
gapminder[50,4]
gapminder[50,"lifeExp"]
gapminder$lifeExp[50]
#challenge
gapminder[gapminder$lifeExp>80,1]
#to show the variable only once without repeating (it was repeating because there is more than 1 year where the condition occurs)
#to filter by that write as follows
unique(gapminder[gapminder$lifeExp>80,1])
#PACKAGES
#to use a new package you need to install it and then load it
install.packages("dplyr")
#library command is to load it
library(dplyr)
library(ggplot2)
install.packages("ggplot2")
library(ggplot2)
#select comand keeps columns and select rows
select(gapminder, country, year, pop)
#filter 
filter(gapminder, country=="Finland")
#pipe in dplyr is %>% and it takes everything that is on the left side of it and sends it to the right side of it
#pipe concept is used to subset data. The order of piping matters.shortcut= Ctrl+Shift+M
gapminder %>%
  filter(pop<=100000) %>%
  select(country, year)
#order matters, the way below doesn't work
gapminder %>%
  select(country, year) %>%
  filter(pop<=100000)
?select
#Challenge
gapminder %>%
  filter(gdpPercap>=35000) %>%
  select(country,year,gdpPercap)
#mutate function
gapminder %>%
  mutate(totalgdp=gdpPercap*pop) %>%
  head

gapminder %>%
  mutate(totalgdp=gdpPercap*pop) %>%
  group_by(continent) %>%
  summarize(meangdp=mean(totalgdp))

gapminder %>%
  mutate(totalgdp=gdpPercap*pop) %>%
  group_by(continent,year) %>%
  summarize(meangdp=mean(totalgdp))

gapminder %>%
  mutate(totalgdp=gdpPercap*pop) %>%
  group_by(continent,year) %>%
  summarize(meangdp=mean(totalgdp),mingdp=min(totalgdp))

meangdp<-gapminder %>%
  mutate(totalgdp=gdpPercap*pop) %>%
  group_by(continent,year) %>%
  summarize(meangdp=mean(totalgdp),mingdp=min(totalgdp))

#Challenge
gapminder %>%
  group_by(continent) %>%
  summarize(maxlifeExp=max(lifeExp))

gapminder %>%
  group_by(year) %>%
  summarize(meanlifeExp=mean(lifeExp),maxlifeExp=max(lifeExp),minlifeExp=min(lifeExp))

gapminder %>%
  filter(country=="Chile", year<1982) %>%
  select(country,year,pop)
?summarize
??summarize
#when a command is loaded in different packages that are in use, 
#R will use by default the command from the latest package loaded.
#This can be modified.
#how to see all the commands in this package?
library(help=dplyr)
#exporting data
write.csv(meangdp,"export_example.csv")
#GGPLOT
#to clean the environment rm(list=ls())
