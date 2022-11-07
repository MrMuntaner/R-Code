library("tidyverse")
library("readxl")

# Importing Data
timeperiods_data <- read_xlsx("data-raw/transit-data.xlsx", sheet = "info")

# Cleaning the column names in my data. They will no longer contain spaces-
# and made lowercase.
colnames(timeperiods_data) <- tolower(make.names(colnames(timeperiods_data)))

#Looking at my cleaned data
timeperiods_data

# Its also good to convert dates into year month day
# I can do this with the lubridate library
library("lubridate")

# This function allows me to convert any ISO formatted date
ymd("1800-01-01")

# By using the mutate function, I can apply the above-
# code to my whole period.start column
timeperiods_data <- timeperiods_data %>%
  mutate(period.start = ymd(paste0(period.start, "-01-01")),
         period.end = ymd(paste0(period.end, "-01-01")))

# Exporting my cleaned data into the data folder
write_csv(timeperiods_data, "data/timeperiods_data.csv")
