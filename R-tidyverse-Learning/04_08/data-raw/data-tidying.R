library("tidyverse")

transport_data <- read_csv("data-raw/transport_data.csv")

write_csv(transport_data, path = "data/transport_data.csv")