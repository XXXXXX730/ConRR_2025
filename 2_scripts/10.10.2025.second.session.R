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

merge(property.partA, property.partB, by = 'id', all=F)
























