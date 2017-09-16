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
diversity3 <- df %>% 
  filter(Reactor.phase == "Startup") %>% select(starts_with("Diversity"))
#### group by ###
meanph <- df %>%  group_by(Reactor.phase) %>% summarise(mean.ph=mean(ph),mean.d=mean(Diversity...D0),sd.ph=sd(ph))

######## challenge generate a summary for reactor phase é and add st dev and log 10 transformed cell count

chal <- df %>% filter(Reactor.cycle == 2) %>% group_by(Reactor.phase) %>% summarise(sd_cy=sd(Diversity...D2),mn = mean( log10 (Cell.density..cells.mL.)))


######### joining data sets #######
physicochem <- df %>%  select(sample_title, temp , ph , Conductivity)
diversity <- df %>%  select(sample_title,contains("Diversity"))
joint <- full_join(physicochem, diversity, by= "sample_title")
