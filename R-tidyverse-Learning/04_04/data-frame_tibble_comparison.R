library("tidyverse")

# Create a variable called baseR_dataframe that uses the baseR function which-
# uses the read.csv to import the timeperiods file
baseR_dataframe <- read.csv("data/timeperiods.csv")
baseR_dataframe

# I will compare the above code and dataframe with the tidyverse_tibble variable which-
# uses the read_csv function from the readr library:

# I can see both column time.period and name are interpreted as character columns. 
# Unlike read.csv which always imports strings as factors
tidyverse_tibble <- read_csv("data/timeperiods.csv")

# Using the class function to see the object I am working with:
# This is a class dataframe
class(baseR_dataframe)

# The tidyverse_tibble has this "spec_tbl_df" "tbl_df" "tbl" "data.frame" business. 
# Whenever I see this, I know i am working with a tidyverse tibble.
class(tidyverse_tibble)

tidyverse_tibble

# Tibbles are really useful in the tidyverse because they allow me to store additional-
# info about the data set in the object.

# Create variable called transport_data and assign it the transport-data file
transport_data <- read_csv("data/transport-data.csv")

# What I might be interested in doing with this data set is grouping together the data-
# by send location.

# How many unique send locations are there?
# I can do this in the tidyverse by using the group_by function.

# I will just pipe the transport_data with the group_by function-
# and specify that I want it grouped by sender.location
transport_data %>%
  group_by(sender.location)

# The print out of a tibble provides me with additional information. 

# I can also extract the first column from each of my variables.
# Extracting the column from baseR_dataframe
# Returns a vector
baseR_dataframe[,1]
baseR_dataframe[[1]]

# I want to see how this behaves on a tidyverse tibble
# When I is the brackets like I did above, on my tidyverse_tibble-
# I get back another tibble.

# So the first column isn't extracted, instead I get the first column as a tibble
tidyverse_tibble[,1]

# If I want it to return a vector, I need to use the double brackets
tidyverse_tibble[[1]]
