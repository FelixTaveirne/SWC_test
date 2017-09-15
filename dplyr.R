##### load required library ###
library(ggplot2)
library(dplyr)

### load data ###
df <- read.csv("Metadata.csv",nrow=77)
stats::filter

mean(df[df$Reactor.phase=="Control","ph"])
levels(df$Reactor.phase)

#################
physicochem <- select(df,ph,temp,Conductivity)
physicochem <- df %>% select(ph,temp,Conductivity) #cmd + shift + m

physicochem.control <- df %>% 
  filter(Reactor.phase == "Control") %>% select(ph,temp,Conductivity)

####select all diversity's within startup ###
diversity <- df %>% 
  filter(Reactor.phase == "Startup") %>% select(Diversity...D0,Diversity...D1,Diversity...D2)
diversity2 <- df %>% 
  filter(Reactor.phase == "Startup") %>% select(contains("Diversity"))
