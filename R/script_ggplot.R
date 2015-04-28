rm(list=ls())
gapminder <- read.csv("gapminder.csv")
#scatterplot of lifeExp vs gdpPercap
ggplot(gapminder,
       aes(x=gdpPercap,y=lifeExp))+
        geom_point()
#two main aspects of this package is 1) Aesthetics (hence the "aes") and 2)geometric objects
#an equivalent way to do this 
p <- ggplot(gapminder,
            aes(x=gdpPercap,y=lifeExp))
p2 <- p+geom_point()
print(p2)
#now to add another aesthetics feature
ggplot(gapminder,
       aes(x=gdpPercap,y=lifeExp))+
          geom_point() + 
            scale_x_log10()
#another feature
ggplot(gapminder,
       aes(x=gdpPercap,y=lifeExp))+
  geom_point(colour="red") + 
  scale_x_log10()
#another syntax, but gives the "log10" word in the axis
ggplot(gapminder,
       aes(x=log10(gdpPercap),y=lifeExp))+
  geom_point(colour="purple")

ggplot(gapminder,
       aes(x=gdpPercap,y=lifeExp))+
  geom_point(colour="blue") + 
  scale_x_log10()

#Challenge 1
china <- gapminder %>%
  filter(country=="China")

ggplot(china,
       aes(x=gdpPercap,y=lifeExp))+
  geom_line(colour="green")

#another way
gapminder %>%
  filter(country=="China") %>%
  ggplot(aes(x=gdpPercap,y=lifeExp))+
  geom_point(colour="green")+ 
  scale_x_log10()
#more aesthetics
gapminder %>%
  filter(country=="China") %>%
  ggplot(aes(x=gdpPercap,y=lifeExp))+
  geom_point(colour="green", size=6, alpha=0.5)+ 
  scale_x_log10()+
  theme_bw()

#more aesthetics
ggplot(gapminder,
       aes(x=gdpPercap,y=lifeExp))+
  geom_point(size=3)+aes(color=continent)+scale_x_log10()+theme_bw()

#Challenge 2
ggplot(gapminder,
       aes(x=gdpPercap,y=lifeExp))+
  geom_point(size=3,shape="o")+
  aes(color=year, size=pop)+
  scale_x_log10()+
  theme_bw()

ggplot(gapminder,
       aes(x=gdpPercap,y=lifeExp))+
  geom_point(size=3)+
  aes(color=year, size=pop, shape=continent)+
  scale_x_log10()+
  theme_bw()
#more aesthetics
ggplot(china,
       aes(x=gdpPercap,y=lifeExp))+
  geom_line(colour="green")+
  geom_point(size=3)

#Challenge 2
gm_chinaindia <- gapminder %>%
  filter(country %in% c("China","India"))
ggplot(gm_chinaindia,
       aes(x=gdpPercap,y=lifeExp))+
        geom_line(aes(group=country))+
        geom_point(aes(color=country),size=4)+
        scale_x_log10()+
        theme_bw()

gapminder %>%
  filter(year==2007) %>%
  ggplot(aes(x=lifeExp))+
  geom_histogram(bin=3,color="red",fill="blue",alpha=0.5)

gapminder %>%
  filter(year==2007) %>%
  ggplot(aes(x=continent, y=lifeExp))+
  geom_boxplot()
#rotate boxes::::last_plot()+coord_flip()
gapminder %>%
  filter(year==2007) %>%
  ggplot(aes(x=lifeExp))+
  geom_density(alpha=0.5)+
  aes(fill=continent)

gapminder %>%
  filter(year==2007) %>%
  ggplot(aes(y=lifeExp, x=continent)) + geom_point()

gapminder %>%
  filter(year==2007) %>%
  ggplot(aes(y=lifeExp, x=continent)) + 
  geom_boxplot()+
  geom_point(position=position_jitter(width=0.1,height=0))

#faceting
gapminder %>%
  filter(year==2007) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp)) + 
  geom_point(position=position_jitter(width=0.1,height=0))+
  scale_x_log10()+
  facet_grid(~continent)

gapminder %>%
  filter(year==2007) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp)) + 
  geom_point()+
  scale_x_log10()+
  facet_wrap(continent~year)

ggplot(gapminder,
       aes(x=gdpPercap, y=lifeExp, color=continent)) + 
      geom_point()+
      scale_x_log10()+
      facet_wrap(~year)

#Challenge X
gm_selec <- gapminder %>%
  filter(country %in% c("Chile","Canada", "Ireland","Argentina","Poland", "India"))
ggplot(gm_selec,
       aes(x=gdpPercap,y=lifeExp))+
        geom_line()+
        facet_wrap(~country)

ggsave("plot.pdf")