library(tidyverse)
# In R, there are built in data sets that I can use. I will use the star-wars data set:
data()
View(starwars)

# In this R program I want to analyze the BMI for the human star-wars characters.
# I will start by piping the desired variables.
# I need to mutate(change) my height from meters to centimeters
# I will create a bmi variable (^2 means its squared)
starwars %>%
  select(sex, mass, height, species) %>%
  filter(species == 'Human') %>%
  na.omit() %>%
  mutate(height = height /100) %>%
  mutate(BMI = mass / height^2) %>%
  group_by(sex) %>%
  summarise(Average_BMI = mean(BMI))


# I will now be renaming variables and reordering columns 
# Start by making a data fame named sw.
# Then pipe the desired columns
# now I rename the columns to the name I want. 
sw <- starwars %>%
  select(name, height, mass) %>%
  rename(weight = mass)


# I will now tidy up my data frame and get rid of missing values-
# rename content that's within a column, and change some metrics.

# With the mutate function i can either create a new variable or-
# or change an existing variable.

# Using the %n% makes the filtering more elegant. 

# The recode function will change the character of male to m and female to f

# The last thing i want to do is create a new variable in my data frame-
# called size. I want size to say, for any of the star-wars characters that are-
# taller than one meter and weigh more than 70 Kilograms I'm gonna call them big.
# If not I'll call them small.

# The size column will return a logical vector. Since i want it to say big or small-
# I will use the if_else method on the size variable
sw1 <- starwars %>%
  select(name, height, mass, sex) %>%
  rename(weight = mass) %>%
  na.omit() %>%
  mutate(height = height / 100) %>%
  filter(sex %in% c('male', 'female')) %>%
  mutate(sex = recode(sex,
                      male = 'm',
                      female = 'f')) %>%
  mutate(size = height > 1 & weight > 75,
         size = if_else(size == TRUE, 'big', 'small'))
