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
  
  #[, 5]	drat	Rear axle ratio
  
  
 # Question 4
  #Create a vector called horsepower that is identical to the column hp. Using this vector, find the horsepower of the 10th car in the dataset
  
  
  horsepower <- mtcars$hp
  
  
 # Question 5
  #Find the value of mpg for the final car in the dataset. Can you find multiple ways of doing this?
  
  
mtcars$mpg[32]  # first option
mtcars[32,1]    # Second option
mtcars$mpg[length(mtcars$mpg)]

mtcars$mpg[dim(mtcars)[1]]

# Second session 

id <- c("REF001", "REF002", "REF003", "REF004", "REF005", "REF006")
house.prices <- c(100, 200, 1000, 50, 500, 500)
no.bedrooms <- c(1, 2, 5, 1, 3, 2)
parking <- c("Yes", "Yes", "Yes", "No", "Yes", "Yes")

temparking <- as.factor(parking)
property <- data.frame(id, house.prices, no.bedrooms, parking)
property

print(property)

?print
??width



temcars <- mtcars

temcars$hp <- as.character(temcars$hp)
temcars
class(temcars$hp);class(mtcars$hp)