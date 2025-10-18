# Practical 4: Data visualisation
# Question 1

install.packages("tidyverse")
library(tidyverse)

# For the dataset films, plot histograms of average rating, split by titleType. Plot all three histograms side by side and all using the same axis scales. Give your histograms an informative title and axis labels.

films <- read.csv('1_data/films.csv')

ggplot(data = films, mapping = aes(x = averageRating, fill = titleType))+
  geom_histogram(binwidth = 1.5)+
  facet_grid(cols = vars(titleType))



# Correction

ggplot(data = films, mapping = aes(x = averageRating, fill = titleType))+
  geom_histogram(bins = 30)+
  labs (title = 'Frequency of Average Rating of Films',
        x = 'Average Rating of the films', 
        y = 'Frequency', 
        fill = 'Type of Film',
        caption = 'Source: Films ConRR data set') +
  facet_grid(cols = vars(titleType))

# Question 2
# Plot boxplots of average rating by titleType, again with an informative title and axes labels.

ggplot(data = films, mapping = aes(x = titleType,y = averageRating))+
  geom_boxplot()+
  labs(title = 'Median Average Rating by type of Title',
       x = 'Type of Title',
       y = 'Average Rating of the Film',
       caption =  'Data source; ConRR films.csv')






# Question 3
# Use subsetting to create a smaller dataset from films, containing only entries (of any type) with more than 800 votes.
# 

high.voted <- subset(films, subset = films$numVotes>800) 
  
  
# From this dataset, create a scatterplot of start year (x axis) against average rating (y axis), giving each title type its own colour.
# 

ggplot(high.voted, mapping = aes( x = startYear, y = averageRating))+
  geom_point()+
  labs(title = 'Average rating of Highly voted Films (Votes > 800)',
       x = 'Year of Film making',
       y = 'Average rating of the film')


# Question 4
# Install and load the package palmerpenguins. This package contains a dataset, 
# penguins, all about measurements of penguins observed in Palmer Archipelago. Feel free to look at the data before creating any plots.
# 

install.packages('palmerpenguins')  


head(penguins)

class(penguins)

str(penguins)

# Create scatterplots showing body mass (body_mass_g) against bill length (bill_length_mm), with separate plots for each species/sex combination. Make sure the plots all have the same scales on the x- and y-axes.
# 

??penguins 
ggplot(penguins, mapping = aes(x = body_mass_g , y = bill_length_mm ))+
  geom_point()+
  labs(title = 'Body mass of Penguins by Bill length stratified by sex and Species',
       y = 'Bill length (millimeters)',
       x= 'Body mass (grams)',
       caption = 'Data source : Palmer Archipelago (Antarctica) Penguin Data')+
  facet_grid(cols = vars(sex) , rows = vars(species))



# Question 5a
# Create a bar chart showing the number of penguins measured on each island.

ggplot(penguins, mapping = aes(x =island ))+
  geom_bar()+
  labs (title = 'Number of Penguins measured in each island',
        x = 'Island',  caption = 'Data source : Palmer Archipelago (Antarctica) Penguin Data'
        )
# 
# Question 5b
# Now create a bar chart showing the number of penguins of each species measured on each island.
# 
ggplot(penguins, mapping = aes(x =island, fill = species ))+
  geom_bar(position = 'dodge')+
  labs (title = 'Number of Each Penguins\' Species measured in each island',
        x = 'Island',  caption = 'Data source : Palmer Archipelago (Antarctica) Penguin Data',
        fill = 'Species'
  )

# Question 5c
# When some combinations are “missing”, the bars in the bar chart can end up with varied widths, with missing combinations ignored. Try adding a facet_grid command to split the bar chart into multiple plots, preserving equal widths in the bars and showing the “missing” combinations.
# 
ggplot(penguins, mapping = aes(x =island, fill = species ))+
  geom_bar(position = 'dodge')+
  labs (title = 'Number of Each Penguins\' Species measured in each island',
        x = 'Island',  caption = 'Data source : Palmer Archipelago (Antarctica) Penguin Data',
        fill = 'Species'
  )+
  facet_grid(rows = vars(species))

# Question 6a
# Create histograms of penguin flipper lengths (flipper_length_mm) by species. 
# This time, put all histograms on a single plot. Avoid “stacking” histograms by 
# using the geom_histogram argument position = "identity".
# 


ggplot(penguins, mapping = aes(y =flipper_length_mm, fill = species))+
  geom_histogram(position = 'identity' )+
  labs (title = 'penguin flipper lengths by species', y ='Penguin flipper lengths in mm',
        x = 'Frequency',  caption = 'Data source : Palmer Archipelago (Antarctica) Penguin Data',
        fill = 'Species')


# Question 6b
# What makes the histogram look wrong? Create a plot where all histograms are still on a single plot, but all the data are visible – look up the geom_histogram argument alpha for how to make the data transparent.
# 
# 
# 
# 

ggplot(penguins, mapping = aes(y =flipper_length_mm, fill = species))+
  geom_histogram(position = 'identity', alpha = 0.5 )+
  labs (title = 'penguin flipper lengths by species', y ='Penguin flipper lengths in mm',
        x = 'Frequency',  caption = 'Data source : Palmer Archipelago (Antarctica) Penguin Data',
        fill = 'Species')


