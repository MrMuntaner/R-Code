library("tidyverse")
library("splines")
library("modelr")

monthly_tdiff <- read_csv("data/long_monthly_tdiff.csv")

by_airport <- monthly_tdiff %>% 
  group_by(airport) %>% 
  nest() # tidyr

airport_model <- function(df) {
  lm(avg.tdiff ~ ns(month, 5), data = df)
}

by_airport <- by_airport %>% 
  mutate(model = map(data, airport_model)) # purrr

by_airport <- by_airport %>% 
  mutate(
    predictors = map2(data, model, add_predictions)
  )
by_airport
