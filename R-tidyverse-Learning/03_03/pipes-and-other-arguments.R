library("praise")
library("tidyverse")

# Vector of prime numbers from 1 to 17
data <- c(1, 3, 5, 7, 11, 13, 17)

# Using the function rep, which repeats the 1st argument the number of times-
# specified in the 2nd argument. 
# So I get praise run 10 times

# What praise does is that it randomly generates a piece of praise
rep(praise(), 10)

# What if i wanted to generate a vector of praise which was as long as the mean-
# of the differences of my vector, data.
rep(praise(), mean(diff(data)))

# What if I wanted to write this using pipes?
# First I pipe my data into the operation diff

# Secondly, I get the mean difference which is 2.6, 2, 3

# Then I pipe that into the rep function with praise
# The period will suck in the left-hand side of the pipe,
# away from the first argument into the second argument.
data %>%
  diff() %>%
  mean() %>%
  rep(praise(), .)

# Use cases for the "." for getting values in a data frame:
# Right now this returns a tibble but I want a vector 
midwest %>%
  select(state) %>%
  unique()

# I need to use the "." to get the first column of the data frame as a vector
midwest %>%
  select(state) %>%
  unique() %>%
  .[[1]]
