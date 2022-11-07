library("tidyverse")

british_weather <- read_csv("data/british_weather.csv")

british_weather %>%
  mutate(tdiff = tmax - tmin)