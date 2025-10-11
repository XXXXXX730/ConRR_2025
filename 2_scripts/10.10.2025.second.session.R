# 2nd session 10.10.2025--------------------------------------------------------

id <- c("REF001", "REF002", "REF003", "REF004", "REF005", "REF006")
house.prices <- c(100, 200, 1000, 50, 500, 500)
no.bedrooms <- c(1, 2, 5, 1, 3, 2)
parking <- c("Yes", "Yes", "Yes", "No", "Yes", "Yes")

property <- data.frame(id,house.prices,no.bedrooms,parking)

#renaming the colnames

colnames(property) <- c('ID','price','beds','park')


rownames(property) <- c("houseA","houseB","houseC","houseD","houseE","houseF")


# COLUMN  BIND

property <- cbind(property, bathroom=c()



































