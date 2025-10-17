# session on the 17th of october

install.packages('librarian')


library(librarian)


librarian::shelf(ggplot2) # shelf helps to take care of both installing and loading the packages like ggoplot2

head(mtcars)  # 

# draw histogram


ggplot2::ggplot(data = mtcars, mapping = aes(x = wt))+    
  geom_histogram(binwidth = 0.5)


hist(mtcars$wt, breaks = 15)


ggplot(data = mtcars, mapping = (aes(x=wt, y=mpg)))+
  geom_point()


ggplot(data = mtcars, mapping = (aes(x=wt, y=mpg)))+
  geom_point()+
  labs(title = 'Car Weight against Miles per Gallon',subtitle = 'For 32 cars', 
       x = 'Weight (1000 lbs)',
       y = 'Miles per gallon',
       caption= 'Data source: Some R course' )



# when you want to change themes in R, you could always add a theme to anamed object and the process is easier




plot <- ggplot(data = mtcars, mapping = (aes(x=wt, y=mpg)))+
  geom_point()+
  labs(title = 'Car Weight against Miles per Gallon',subtitle = 'For 32 cars', 
       x = 'Weight (1000 lbs)',
       y = 'Miles per gallon',
       caption= 'Data source: Some R course' )

plot_1 <- plot + theme_classic()



plot_base <- plot(x= wt, y = mpg, data = mtcars) 




plot(x= mtcars$wt, y = mtcars$ mpg)


plot(mpg ~ wt, data = mtcars)






# using the ggplot function, create a plot that has #


mtcars$cyl <- factor(mtcars$cyl)

ggplot(data = mtcars, mapping = aes(x = cyl, y = mpg))+
  geom_boxplot()


plot(mpg~cyl, data = mtcars)



# ggplot - a dot plot on the boxplot


ggplot(data = mtcars, mapping = aes)





## 


ggplot(data = mtcars, mapping = aes(x= cyl , y = mpg)) +
  geom_dotplot(binwidth = .5,stackdir = 'center', binaxis = 'y')


ggplot(data = mtcars, mapping = aes(x= cyl , y = mpg)) +
  geom_boxplot()+
  geom_dotplot(binwidth = .5,stackdir = 'center', binaxis = 'y')



# deciphering the difference between facet grid and 

# way of ploting more than 2 variables in the same plot

ggplot(data= mtcars, mapping = aes(x= wt, y = mpg))+
  geom_point()+                                      # what I have found is the fact that
  facet_grid(rows= vars(cyl))




ggplot(data= mtcars, mapping = aes(x= wt, y = mpg))+
  geom_point()+                                      # what I have found is the fact that
  facet_grid(cols= vars(cyl))


# using more than 2 varaiables#




ggplot(data = mtcars, mapping = aes(x= wt, y = mpg))+
  geom_point()+
  facet_grid(rows= vars(cyl), col= vars(am), labeller = label_both)



# using a color  data to visualize the data set


ggplot(data=mtcars, mapping = aes(x = wt, y = mpg, colour = cyl))+
  geom_point()




ggplot(data=mtcars, mapping = aes(x = wt, y = mpg, shape = cyl))+
  geom_point()




## using both col and shape as well legend positioning in the plot




ggplot(data = mtcars, mapping = aes(x  = wt , y = mpg, col = cyl, shape = as.factor(am)))+
  geom_point()+
  labs(col = 'Cylinders', shape = 'Manual ')+
  theme(legend.position = 'inside', legend.position.inside=c(0.85, 0.7))



ggplot(data= Orange, mapping=aes(x = age, y = circumference, col = Tree))+
  geom_line()

Orange



# Geom bar 


ggplot(data = mtcars, mapping = aes(x = cyl))+
  geom_bar()


# Can we make different color plot by the type of the bar plot


mtcars$am <- factor(mtcars$am, labels=c("auto", "manual"))

ggplot(data = mtcars, mapping = aes(x = cyl, fill = am))+ # separate barplot
geom_bar(position = 'dodge' )


ggsave('4_outputs/bar.png')

# Correction of the practical 3
# 
# Question 1
# Give the column originalTitle a new name, Title . A good place to start is to 
# find out which column is named originalTitle 

films <- read.csv('1_data/films.csv')

colnames(films) == "originalTitle"

colnames(films)[colnames(films) == "originalTitle"] <- 'Title'

# Lecturer way of doing the things

# 'tconst', 'averageRating', 'numVotes', 'titleType', 'primaryTitle', 'startYear', 'genres'



selected.var <- c('tconst', 'averageRating', 'numVotes', 'titleType', 
                  'primaryTitle', 'startYear', 'genres')


# this was the difference between the approach I used and the way the 
#lecturer did the things

films <- films[,selected.var]

unique(films$titleType)


summary(films$averageRating[films$titleType == "movie" ])
summary(films$averageRating[films$titleType == "tvMovie" ])
summary(films$averageRating[films$titleType == "short" ])


# The second option to work thru this would be 

summary (subset(x =films, subset=titleType =="movie", select = averageRating ))



tapply(films$averageRating, films$titleType, summary)

aggregate(x = films, averageRating~titleType, summary)




















