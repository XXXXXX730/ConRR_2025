?sqrt
require(stats) # for spline
require(graphics)
xx <- -9:9
plot(xx, sqrt(abs(xx)),  col = "red")
lines(spline(xx, sqrt(abs(xx)), n=101), col = "pink")
[Package base
  
  rnorm(100
        )
  
  
  
  
  
  
  mouse.weights <- c(23,21,18,26) 


  mouse.colours <- c("purple", "red", "yellow", "brown")
  
  mouse.colours <- c(purple, "red", "yellow", "brown")
 
 mouse.strains <- c("W", "X", "Y", "Z")
  
 mouse.strains[2]                 

 
 
 1:10
6;3 ?  # Important learining point : to vs ; I am done with one and want to proceed with the next
  
  
  class(mouse.weights)
  
  
some.logic <- c(TRUE, TRUE, FALSE)
class(some.logic)
  
mouse.info <- data.frame(weights=mouse.weights, colours=mouse.colours)
mouse.info <- data.frame(mouse.weights, mouse.colours) #name of the colums becomes the o bbjects names#


dim(mouse.info)
nrow(mouse.info)
ncol(mouse.info)

mouse.info 
  
  mouse.info[2,2]

  
  
  mouse.info[,2]
  
  mouse.info$mouse.weights
mouse.info[,c('weights','colours')]  
  
mouse.info[, c("weights", "colours")]
  
  
## Practical 0: Commands and subsetting data using the mtcars dataset-----------

# Question 1 : Use the head function to examine the mtcars dataset.
  head(mtcars)
#  Question 2 Using the dim command, find the number of rows and columns in the dataset.
  dim(mtcars)
  
# Question 3 Call up the help file for mtcars. What does the data in the column “drat” refer to?
?mtcars
  
  help(mtcars) # this is also an alternative
  
  #[, 5]	drat	Rear axle ratio
  
  
 # Question 4
  #Create a vector called horsepower that is identical to the column hp. Using this vector, find the horsepower of the 10th car in the dataset
  
  
  horsepower <- mtcars$hp
  horsepower[10]
  # alternatives
  
  horsepower <- mtcars[,'hp']
  
  
 # Question 5
  #Find the value of mpg for the final car in the dataset. Can you find multiple ways of doing this?
  
  
mtcars$mpg[32]  # first option
mtcars[32,1]    # Second option


mtcars$mpg[dim(mtcars)[1]]


#if you want to create a script that would always generate the final 
#element regardless the changing the number of elements

mtcars$mpg[nrow(mtcars)]
mtcars$mpg[length(mtcars$mpg)]


# Second session 

id <- c("REF001", "REF002", "REF003", "REF004", "REF005", "REF006")
house.prices <- c(100, 200, 1000, 50, 500, 500)
no.bedrooms <- c(1, 2, 5, 1, 3, 2)
parking <- c("Yes", "Yes", "Yes", "No", "Yes", "Yes")

temparking <- as.factor(parking)
property <- data.frame(id, house.prices, no.bedrooms, parking)
property

print(property)


#

## Sumarizing data-----------------------------------------------------


mtcars$cyl <- factor(mtcars$cyl)
mtcars$am <- factor(mtcars$am, labels = c('auto','manual'))


boxplot(mpg~cyl, data=mtcars)



boxplot(mpg~am*cyl, data=mtcars)


hist(mtcars$mpg)

hist(mtcars$mpg, breaks = 15)  # gives the number of columns we desire to see




# scatter plot

plot(mpg~disp, data = mtcars)


pairs(~mpg+disp+vs, data = mtcars)



# tables based visuals of the data




xtabs(~am, data = mtcars) # only for categorical data sets


xtabs(~am+cyl, data=mtcars)



prop.table(xtabs(~am, data=mtcars), margin=1)

prop.table(xtabs(~am+cyl, data=mtcars), margin=1)

prop.table(xtabs(~am+cyl, data=mtcars))

#aggregate()


aggregate(mpg~am, data=mtcars, mean)

aggregate(mpg~am+cyl, data = mtcars, mean)


aggregate(cbind(mpg,disp)~am, data = mtcars, mean)




## practical 2----------------------------------------


# 
# Question 1
# How many guinea pigs received each dose?

xtabs(~dose, data=ToothGrowth)

#   
#   How many received each supplement type?

xtabs(~supp, data=ToothGrowth)


#   
#   How many received each combination of dose and supplement type?


xtabs(~supp+dose, data=ToothGrowth)

# 
# Question 2
# What proportion of total guinea pigs received each combination of dose and supplement type?

prop.table(xtabs(~supp+dose, data=ToothGrowth))
# 
# Question 3
# What was the maximum tooth length recorded for each dose?

summary(ToothGrowth$len)
max(ToothGrowth$len)

#   
#   For each combination of dose and supplement type, what is the sum of all tooth lengths?

prop.table(cbind())



# Question 4
# Draw a boxplot of tooth length for each dose of vitamin C.
# 
boxplot(len~dose, data=ToothGrowth)
# Draw a boxplot of tooth length for each combination of dose and 
# supplement type, with the first two boxplots showing dose 0.5, the 
# following two boxplots showing dose 1.0 and the final two plots showing 
# dose 2.0.
boxplot(len~dose*supp, data=ToothGrowth)
# 


# Question 5
# Create a histogram of tooth length, containing more than 10 columns or “breaks”.


hist(ToothGrowth $ len, data= ToothGrowth, breaks= 14)
