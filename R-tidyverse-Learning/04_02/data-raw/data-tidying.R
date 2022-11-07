library("tidyverse")
library("readxl")

# Function for reading/importing from an excel file:
# I need to somehow tell read_excel to skip over cell A1-
# and start importing from cell B1

# Sheet reads in the specific sheet and range specifies my range of cells-
# as being from B1 to C7, because that's where my data lives.
read_excel("data-raw/transit-data.xlsx",
           sheet = "info",
           range = "B1:C7")

# I can specify the column names that I want explicitly: 
# Specify that instead of the range B1 through C7-
# I want cell_cols B through C

# When I run this code, I get the same as the code above, but now if-
# the data in-putter added additional rows to this collection of interesting time-
# periods, they would be imported as well.
read_excel("data-raw/transit-data.xlsx",
           sheet = "info",
           range = cell_cols("B:C"))

# Now I will store this data against a variable I'll call info.
info <- read_excel("data-raw/transit-data.xlsx",
                   sheet = "info",
                   range = cell_cols("B:C"))

# Write the tidy data frame into my data folder using the write_csv function
write_csv(info, path = "data/timeperiods.csv")

# How about the data in the second sheet?
# It also has a row that I need to skip over.

# When I run this and look at the column names, I can see that it isn't structured neatly.
read_excel("data-raw/transit-data.xlsx",
           sheet = "transport data")

# By using the skip argument, I can see that my data makes more sense now.
# The first column is called sender location, the second is sender latitude.
read_excel("data-raw/transit-data.xlsx",
           sheet = "transport data",
           skip = 1)

# Before I can save this into my data folder, I need to do more cleaning.
# The data in-putter used spaces in the column names because they wanted human readable-
# names.

# Assign the desired data frame to the variable transport_data
transport_data <- read_excel("data-raw/transit-data.xlsx",
           sheet = "transport data",
           skip = 1)

# Now I will update the column names and use the make.names() to remove spaces and other characters
colnames(transport_data) <- make.names(colnames(transport_data))

# Check the new column names
colnames(transport_data)

# I can finally write the data out now that its tidy and clean.
write_csv(transport_data, path = "data/transport_data.csv")
