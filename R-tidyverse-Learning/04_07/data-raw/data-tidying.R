library("tidyverse")
library("readxl")
library("lubridate")

transport_data <- read_xlsx("data-raw/transit-data.xlsx", sheet = "transport data", skip = 1)

# All this does is it cleans up the column names. It removes the spaces and replaces-
# them with periods. 
colnames(transport_data) <- tolower(make.names(colnames(transport_data)))


transport_data %>%
  separate(sender.location, c("sender.country",
                              "sender.city"), sep = ",", extra = "merge")

# Here I want to look at the rows that the error is showing me for my data
transport_data %>%
  select(sender.location) %>%
  slice(c(316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331))
# Upon running the code above, I can see the problem. The sender location-
# includes multiple deliminators. I can fix this by adding the "extra" parameter in line 14.

transport_data %>%
  separate(sender.location, c("sender.country",
                              "sender.city"), sep = ",", extra = "merge") %>%
  slice(c(316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331))

# I will now do the same with my receiver location
transport_data %>%
  separate(sender.location, c("sender.country",
                              "sender.city"), sep = ",", extra = "merge") %>%
  


write_csv(transport_data, "data/transport_data.csv")