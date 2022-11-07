# basic math operation
1 + 2

# Assign variable a to the math operation
a = 1 + 5

# R is case sensitive so A is not the same as a
A = 1 + 10

# R has three basic data types:
# 1. numeric
# 2. character
# 3. logical

# Numeric Values: can be integers or whole numbers
mynumber = 0.2
mynumber = 10

# Logical values: Use T/TRUE for true and F/FALSE for false
mylogical = T
mylogical1 = F

# Character values:"" and '' are equivalent 
# Rstudio uses the double quotes so it turns the single quotes in doubles 
mycharacter = "my little story"
mycharacter1 = 'my little story'

# Factors: used and seen in R as categorical variables that I would use when do-
# stats. They are basically text or they can be numbers
myfactor = as.factor("female")

# With all these data types I can then put them together or mix them up to-
# create a datatype called a vector.

# To create a vector i need the function c. c stands for concatenate.
# Here i create a vector of numeric values
vec1 = c(1,2,2,23,0.2)

# I also create a vector of logical values. I will make them the same length-
# as vec1 so that i can use it in another example.
vec2 = c(T,F,FALSE,TRUE,F)

# Creating a vector of characters
vec3 = c("a","b","b","my little story","z","20")

# To make a vector of factors i need to include the as.factor function
vec4 = as.factor(c("female", "male", "male", "female", "male"))

# If I put two different data types in one vector, it will transform it following-
# some certain rules:

# 1st rule, if I for example put only TRUE and FALSE together, they will be true and-
# false. If I put TRUE and FALSE with numeric values, the TRUE and FALSE-
# would become numeric values, and the TRUE would be assigned the number 1 and-
# FASLE would be 0. 

# 2nd rule, if I put numeric, logical, and character values together, it will-
# transform everything to character values.
vec5 = c(1, TRUE, "b")

# If i only have 1, TRUE in my vector, it will transform the TRUE to 1
vec6 = c(1, TRUE)

# I can give these variables to an object called a list. 
# A list can contain anything. It can contain a function, vector, another list-
# it can also contain a data frame.

# Here i will create a list and pass in the variables I made above as the element.
mylist = list(vec1, vec2, vec3)

# second list will contain more data types like a list within the list!
# I will also pass in the mean function
mylist2 =  list(vec1, vec2, vec3, 20, list(vec1, vec2, vec3), mean)

# Data frames: a type of list. very similar to python data frame

# If i try to include vec3 in the below line of code, it will give me an error because vec1 and vec2-
# are of length 5 and vec3 is length 6. This is illegal
data.frame(vec1,vec2)

# The above code creates a data frame with two columns.
# I can choose to name my columns 
data.frame(a = vec1, b = vec2)

# I can also do it the long way
df = data.frame(a = c(1,2,2,23,0.2), b = c(T,F,FALSE,TRUE,F))

# Matrix: to create a matrix i use the matrix function. I need to give it the number rows and columns 
# Here i create a matrix using vec3 and told the matrix function i wanted 2 columns and three rows
matrix(vec3, 2,3)

# I can see in the console that it prints out my character vector in 2 dimensions.
# I will save it to the mymatrix variable
mymatrix = matrix(vec3, 2,3)

# Indexing: The first thing that i can index is vectors. Vectors are in 1 dimension so I will-
# index them using the []

# Getting the second value of my vector 2
vec2[2]
