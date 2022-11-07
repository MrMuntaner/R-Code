library(tidyverse)
View(msleep)

# Working with only the subset of data I want:

# 1
ms_df <- msleep %>%
  select(name, sleep_total) %>%
  filter(sleep_total > 18)


# 2:
# I can use the ! to indicate that i want the filter to do the-
# opposite. So in the code below I will get the animals that sleep less 
ms_df <- msleep %>%
  select(name, sleep_total) %>%
  filter(!sleep_total > 18)


# 3:
# I can use a filter with more than one criteria 
# The ',' behaves like a 'and' meaning that both criteria have to be met
ms_df <- msleep %>%
  select(name, order, bodywt, sleep_total) %>%
  filter(order == 'Primates', bodywt > 20)

# 4:
# Using the | which is the OR operator, meaning that if either of these-
# criteria are met, then return the results. 
ms_df <- msleep %>%
  select(name, order, bodywt, sleep_total) %>%
  filter(order == 'Primates' | bodywt > 20)


# 5:
# I can use the OR operator multiple times to continue to filter
ms_df <- msleep %>%
  select(name, sleep_total) %>%
  filter(name == 'Cow' |
           name == 'Dog' |
           name == 'Goat')


# 6:
# A more elegant way of doing the above code is by using the %in%-
# and create a concatenation. This is filtering out any name within the concatenation.
ms_df <- msleep %>%
  select(name, sleep_total) %>%
  filter(name %in% c('Cow', 'Dog', 'Horse'))


# 7:
# Using the between, filters out the numbers between the given parameter
ms_df <- msleep %>%
  select(name, sleep_total) %>%
  filter(between(sleep_total, 16, 18))


# 8:
# This will filter anything that is near or close to the criteria defined.
# It will return anything that is .5 away from 17
ms_df <- msleep %>%
  select(name, sleep_total) %>%
  filter(near(sleep_total, 17, tol = 0.5))


# 9:
# Filtering for a particular variable with a missing value
ms_df <- msleep %>%
  select(name, conservation, sleep_total) %>%
  filter(is.na(conservation))


# 10:
# Opposite as the code above. This will return the values in the variable(column)-
# that are not missing 
ms_df <- msleep %>%
  select(name, conservation, sleep_total) %>%
  filter(!is.na(conservation))
