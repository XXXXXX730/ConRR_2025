# 2nd session 10.10.2025--------------------------------------------------------



# Data class in R 



id <- c("REF001", "REF002", "REF003", "REF004", "REF005", "REF006")
house.prices <- c(100, 200, 1000, 50, 500, 500)
no.bedrooms <- c(1, 2, 5, 1, 3, 2)
parking <- c("Yes", "Yes", "Yes", "No", "Yes", "Yes")


class(id)

reason <- factor(c("Too many side effects", "Moved house", "Unknown"))

reason <- as.character(reason)

class(reason)


housing.info <- data.frame(id=id, price=house.prices, 
                          bedroom=no.bedrooms, parking=parking)


dim(housing.info)

head(housing.info)

ncol(housing.info)
nrow(housing.info)

housing.info[3,3]

housing.info[,1]

housing.info[3,]


# if the data set is large and its difficult to know the position of col of a given variable

housing.info[,'parking']

# this is the same as;

housing.info$parking

# if we need to call multiple columns

housing.info[,c('price','bedroom')]

housing.info[,1:3]

# if the columns or rows that we want to call arent consecutive we use c()

housing.info[c(1,5),c(1,3:4)]

#renaming the colnames

#always use the comments to rememeber how your code behaves

# expanding data frames


id <- c("REF001", "REF002", "REF003", "REF004", "REF005", "REF006")
house.prices <- c(100, 200, 1000, 50, 500, 500)
no.bedrooms <- c(1, 2, 5, 1, 3, 2)
parking <- c("Yes", "Yes", "Yes", "No", "Yes", "Yes")


property <- data.frame(id,house.prices, no.bedrooms, parking)



# changing the column names and row names

colnames(property) <- c('ID', 'price', 'beds', 'park') 

# its also possible to create the name of the columns when creating the data frame, 
#by puting the names of the columns as arguemnents



property <- data.frame(ID=id, price=house.prices, beds=no.bedrooms, park=parking)


# if you need to change the name of a single column




colnames(property)[2] <- 'price.usd'
 

colnames(property)[2] <- 'price'


rownames(property) <- c("houseA","houseB","houseC","houseD","houseE","houseF")


# you can then call the row of specific name

property["houseA","price"]


# adding column to the existing data set

property$type <- c("terrace", "terrace", "detached", "flat", "detached", 
                   "detached")


property <- cbind(property, bathrooms=c(1, 1, 3, 1, 2, 2),
                  city.centre=c("No", "No", "Yes", "No", "Yes", "No") )

property <- rbind(property,houseG = c('REF007', 578,4,'No','detached',2,'No'))

# the merge function


property.partA <- property[,1:4]
property.partA
property.partB <- property[3:6, c(1,2,4:6)]

property.partB


merge(property.partA, property.partB, all=T, )

?merge

merge(property.partA, property.partB, all.y = T)

# Projects

read.csv('1_data/neutrophils.csv')

# the best way to import data is using the project package management system known as the `pacman()`

pacman::p_load(here,rio)

neutro <- rio::import(here('1_data','neutrophils.csv'))


neutro <- read.csv(file.path('1_data/neutrophils.csv'), header = F)
neutro


colnames(neutro) <- c("TypeA", "TypeB", "TypeC", "TypeD")

head(neutro,10)
tail(neutro,10)

dim(neutro)


summary(neutro)


neutro[,1]

sum(neutro[,1])

neutro[,2]
sum(neutro[,2], na.rm = T)

colSums(neutro)


colSums(neutro, na.rm = T)

mean(neutro$TypeD, na.rm = T) 

sd(neutro$TypeD, na.rm = T)


#Practical session 1



films <- read.csv('1_data/films.csv')

# Question 1
# Download the file films_2.csv from Moodle, and create an object called films that contains the data from this file.
# 

# Question 2
# (2a) Find out how many rows and columns there are. (2b) What are the column names?
#   
dim(films)
colnames(films)
#   Question 3
# Find the number of votes for elements 35 to 70 in the dataset.
films[35:70,'numVotes']
# 
# Question 4
# What is the class of the column numVotes?
#   
class(films$numVotes)
#   Question 5
# Using the sum and length function, find the mean number of votes across all entries. Does this agree with the answer that you get with the mean function?
#   
mean.votes.0 <- sum(films$numVotes)/length(films$numVotes)

mean.votes.1 <- mean(films$numVotes)
mean.votes.0==mean.votes.1

#   Question 6
# Find the mean of each numeric column – average rating, number of votes and start year.
# 
# 
mean(films$numVotes)
mean(films$averageRating)
mean(films$startYear)


#chapter 4 summarizing the data=================================================


head(mtcars)
tail(mtcars,30)

summary(mtcars)

class(mtcars$cyl)

mtcars$cyl[5]+1


mtcars$cyl <- factor(mtcars$cyl)

class(mtcars$cyl)



mtcars$cyl[5]+1

mtcars$am <- factor(mtcars$am, labels = c('auto', 'manual')) 



#4.2 Graphical Summaries========================================================


boxplot(mpg~cyl, data = mtcars)


boxplot(mpg~cyl*am, data= mtcars)


levels(mtcars$cyl)


levels(mtcars$am)

mtcars$cyl <- factor(mtcars$cyl, levels = c('4','6','8')) # once the function factor is called, it creates levels by increasing order numerically or alphabetically
# unless otherwise specified



hist(mtcars$mpg, breaks = 20)

plot(mpg~cyl, data = mtcars)

plot(mpg~dip, data = mtcars)


pairs(~mpg+disp+vs, data = mtcars)



# 4.3 Table based summaries=====================================================


xtabs(~am, data=mtcars)


xtabs(~am+cyl, data=mtcars)


prop.table(xtabs(~am, data=mtcars))



prop.table(xtabs(~am+cyl, data=mtcars), margin = 2)

prop.table(xtabs(~am+cyl, data=mtcars), margin = 1)


aggregate(mpg~am, data= mtcars, mean)

aggregate(mpg~am+cyl, data= mtcars, mean)

aggregate(cbind(mpg,disp) ~ am+cyl, data= mtcars, mean)

# 
# Practical 2: Summarising data
# We will work with the ToothGrowth dataset, which details tooth length (len) in 60 guinea pigs. 
# Each guinea pig received one of three doses of vitamin C (dose), administered using one of two supplement types (supp). 
# Use the command ToothGrowth to see the data in R, and ?ToothGrowth to read more about the dataset.
# 
# Question 1
# How many guinea pigs received each dose?
#   
xtabs(~dose, data = ToothGrowth)

#   How many received each supplement type?

xtabs(~supp, data = ToothGrowth)
#   
#   How many received each combination of dose and supplement type?

xtabs(~supp+dose, data = ToothGrowth)
#   
#   Question 2
# What proportion of total guinea pigs received each combination of dose and supplement type?
#   
prop.table(xtabs(~supp+dose, data = ToothGrowth))
#   Question 3
# What was the maximum tooth length recorded for each dose?
#   
aggregate(len~dose, data = ToothGrowth, max)
#   For each combination of dose and supplement type, what is the sum of all tooth lengths?
#   
aggregate(len~dose+supp, data = ToothGrowth, sum)
#   Question 4
# Draw a boxplot of tooth length for each dose of vitamin C.
#

boxplot(len~dose, data = ToothGrowth)
# Draw a boxplot of tooth length for each combination of dose and supplement type, with the first two boxplots showing dose 0.5, the following two boxplots showing dose 1.0 and the final two plots showing dose 2.0.
# 

ToothGrowth$dose <- factor(ToothGrowth$dose)
boxplot(len~supp*dose, data = ToothGrowth)
# Question 5
# Create a histogram of tooth length, containing more than 10 columns or “breaks”.

hist(ToothGrowth$len, breaks = 15)



# Chapter 5 - Subsetting and Filtering data-------------------------------------

a <- 101:110

# calling elemets

# continous elemets

a[4:7]



# separate elements or discontinuous set of elements

a[c(3,7,8)]


# You can also call the elements using named objects instead of indices

b <- 5

a[b]

c <- c(2,6,8)
a[c]


# The object that we to call inside another object must contain elements that are indices of the of the object from which we are calling elements





# Logical test and the `which()` command

property <- data.frame(
  id=c("REF001", "REF002", "REF003", "REF004", "REF005", "REF006"),
  house.prices=c(100, 200, 1000, 50, 500, 500),
  no.bedrooms=c(1, 2, 5, 1, 3, 2),
  parking=c("Yes", "Yes", "Yes", "No", "Yes", "Yes"),
  type=c("terrace", "terrace", "detached", "flat", "detached", "detached"),
  bathrooms=c(1, 1, 3, 1, 2, 2),
  city.centre=c("No", "No", "Yes", "No", "Yes", "No")
)

rownames(property) <- c("houseA","houseB","houseC","houseD","houseE","houseF")


property


# Which house prices are exactly equal to 500?


property$house.prices == 500
which(property$house.prices == 500)

# difference between == and =. `=` is <-  while == is logical indicator
# Now ask R if the house prices are greater than 300:



which(property$house.prices > 300)


# NB the values that are displayed after the command which are the ones that indicate the location of the value rather than the value itself



# how do we find these values exactl:
# I think once we have the indices from which() or simply ==, we can call them using the []

property$house.prices[which(property$house.prices > 300)]


# using the method above find the expensive houses' price, price >300


expensive.house <- property$house.prices > 300

property$house.prices[which(expensive.house)]


# R also runs the logical outputs


property$house.prices  > 300

property$house.prices[c(FALSE, FALSE,  TRUE, FALSE,  TRUE,  TRUE)] # I would emphasis on the usage of the [] vs () very well


# so from this we could also learn that we can also skip the whicj


property$house.prices[property$house.prices > 300]


# Either way we asking R two things by doing this, what are the location of the elemets greater than 300 and what the values of these elemets




property[c(TRUE, FALSE, FALSE, FALSE, FALSE, TRUE), ] # on the basis what premise does R remeber the logicals are we not specifying one


# It turns out like mentioned priorly in the early sessions the logical is used as a steping stone in subsetting

# when we put TRUE or False we are telling which rows or columns we are interested in


# the `subset()` function:
# it uses two arguements, ie the data set and the condition upon which its going to select the subset of data


subset(x = property, house.prices > 300)

# its also possible to subset over multiple conditions

subset(x = property,subset = house.prices>300 & no.bedrooms>=3, select = c('id','type','city.centre'))

# we can also remeber to 

# Practical 3--------------------------------------------------------------------


films <- read.csv('1_data/films.csv', header = T) 

# 
# Question 1
# Change the column name originalTitle to a new name, Title. A good place to start is to find out which column is named originalTitle.


title <- which(colnames(films)=='originalTitle')


colnames(films)[title] <- 'Title'

# Question 2
# Overwrite the current dataset with a new dataset containing the following 
# columns only: tconst, averageRating, numVotes, titleType, primaryTitle, startYear, genres.

selected.variables <- c('tconst', 'averageRating', 'numVotes', 'titleType', 
                        'primaryTitle', 'startYear', 'genres')

films <- films[,selected.variables]

# 
# Question 3
# Obtain a summary of the dataset, and note the different ways in which different types of data are summarised.

summary(films)
# 
# Question 4a
# Use the command unique() to find out what are the three kinds of titleType in the dataset.

unique(films$titleType)

# 
# Question 4b
# For each kind, obtain summary data of average ratings.

films$titleType <- factor(films$titleType)


xtabs(~titleType, data = films)

prop.table(xtabs(~titleType, data = films))

hist(x = films$averageRating, breaks = 10)

boxplot(averageRating~titleType, data = films)

aggregate(averageRating ~ titleType, data = films, FUN = mean)

aggregate(averageRating ~ titleType, data = films, FUN = sd)
# 
# Question 5
# Create a smaller dataset containing only entries of the type “movie”. Call this smaller dataset movies.only


movie.only <- subset(x = films, subset= titleType == 'movie' )
# 
# Question 6
# Create a further subset of movies.only, containing only movies with average 
# rating greater than 7.5 AND with number of votes greater than 100; how big is this dataset?
# 

good.movies <- subset(x = movie.only, subset = averageRating > 7.5 & numVotes > 100) 

dim(good.movies)



# 






