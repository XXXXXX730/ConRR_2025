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




















