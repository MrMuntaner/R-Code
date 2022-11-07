library("tidyverse")

transport_data <- read_csv("data/transport_data.csv")

## ================== Measurement column
measure_col_naked <- number.of.items

transport_data %>%
  select(measure_col_naked)

## ================== Useful columns

useful_columns_naked <- c(date, receiver.city, number.of.items)

transport_data %>%
  select(useful_columns_naked)
