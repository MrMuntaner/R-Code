# My data frame 
cars <- my_data

# Using the plot function to make a histogram
hist(cars$cylinders)

# If I use the function attach, I don't need to use the $ -
# because the object cars is now attached. This allows me to just-
# use the column names.
attach(cars)
hist(highwaympg)

# I can use the summary function to get a stats description of the-
# values in the data frame 
summary(cars)
summary(citympg)

# I can also use the class function to tell me the data type of my object
class(cars)
class(citympg)

# I can also length the length of a specific column
length(citympg)

# Getting unique values
unique(citympg)

# Same as python, I can use the head and tail function
head(cars)
tail(cars)

# Getting a subset of columns and rows
# Here i got rows 3 to 6 for columns 1 and 2 
cars[3:6,1:2]

# When i want some info on the function I want to use I can-
# put the ? in front of the function name and i will get a -
# description of the function
?median

# Because I have missing data in the highwaympg column, it returns a NA-
# and cant calculate the median.
median(highwaympg)

# To fix this I need to change the parameter na.rm = FALSE to TRUE
median(highwaympg, na.rm = TRUE)
