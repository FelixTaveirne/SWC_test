df <- read.csv("Metadata.csv",nrows=77)

# which variables?
str(df)
df$Reactor.cycle <- as.factor(df$Reactor.cycle) #to make 1 and 2 and not a continu variable legend

#startplot
library("ggplot2")
ggplot(data=df,aes(x= Timepoint,y=temp,fill=Reactor.cycle))+
  geom_point(shape=21,size=4) +
  geom_line()
####### first plot#######
# store GGplot object 
p1 <- ggplot(data=df,aes(x= Timepoint,y=temp,fill=Reactor.cylce))
p1 <- p1 + geom_point(shape=21,size=4,alpha = 0.5) + theme_bw() +
  geom_line()
# Facet it
p3 <- p1 + facet_grid(~Reactor.cycle)

# how do i know whats in reactor phase
unique(df$Reactor.phase)
#plot alles in fucntie van reactor phase
p4 <- p1 + facet_grid(Reactor.phase~Reactor.cycle)

#####second plot######
# store GGplot object 
p1 <- ggplot(data=df,aes(x= Timepoint,y=temp,fill=Reactor.phase))
p1 <- p1 + geom_point(shape=21,size=4,alpha = 0.5) + theme_bw() +
  geom_line(aes(color=Reactor.cycle))
# Facet it
p3 <- p1 + facet_grid(~Reactor.cycle)

# how do i know whats in reactor phase
unique(df$Reactor.phase)
#plot alles in fucntie van reactor phase
p4 <- p1 + facet_grid(Reactor.phase~Reactor.cycle)

################
### right side: conductivty
### middle: diversity DO
### left: cell density

