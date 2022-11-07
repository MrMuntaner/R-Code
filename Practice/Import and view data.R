# Import the data
my_data <- read.csv('vehicles.csv')

# View Data
head(my_data)
tail(my_data)
View(my_data)

# Extract components of my dataframe:
# Rows are observations
# Columns are variables 

# Indexing my data: 1 means what row and 3 means what column
my_data[1,3]

# This will return my entire 3rd column 
my_data[ ,3]

# This will do the same as the code above
my_data$displacement

# Install and use packages:
# Packages have programmed functions that solve specific problems -
# and expand the R vocabulary
install.packages('tidyverse')
library('tidyverse')
require('tidyverse')
# tidyverse includes packages like dplyr and ggplot2

# Start my analysis:
# The pipe operator means that whatever i have done on the left side, gets 
# piped into the next line of code. This behaves like a filtering query.

my_data %>%
  select(highwaympg, make, model) %>%
  filter(highwaympg < 20) %>%
  arrange(model)

