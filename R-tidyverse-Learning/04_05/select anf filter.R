library("tidyverse")

# Import data into a variable 
transport_data <- read_csv("data/transport-data.csv")

# I might be interested in only extracting the sender location and the receiver location-
# to see how many unique pairs of send and receive locations there were.

# By piping the transport_data into the select function, I can easily do this.
transport_data %>%
  select(sender.location, receiver.location)

# But i want the unique send receive locations. 
# I just simply add a pipe and type unique()
transport_data %>%
  select(sender.location, receiver.location) %>%
  unique()

# Filtering out the locations to only have Templin as my receiver location?
transport_data %>%
  filter(receiver.location == "DEU, Templin")

# Getting the most recent transit to Templin:
# 1st, extract the date 
transport_data %>%
  select(date)

# Since the dates are returned in a tibble, I want to extract as a vector
# 2nd, I need to pipe the desired column with double brackets-
# then i use the max function to get the dates
transport_data %>%
  select(date) %>%
  .[[1]] %>%
  max()

# For earliest date I just need to use the min function instead
transport_data %>%
  select(date) %>%
  .[[1]] %>%
  min()

transport_data %>%
  filter(receiver.location == "DEU, Templin") %>%
  filter(date == max(date))

# I can fold columns away using the select verb
# The - sign inside the select function 
transport_data %>%
  filter(receiver.location == "DEU, Templin") %>%
  filter(date == max(date)) %>%
  select(-receiver.location)

# By using the -contains helper function i can filter out more things
transport_data %>%
  filter(receiver.location == "DEU, Templin") %>%
  filter(date == max(date)) %>%
  select(-contains("receive"))
