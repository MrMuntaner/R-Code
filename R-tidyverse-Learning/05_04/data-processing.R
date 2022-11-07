library("tidyverse")

transport_data <- read_csv("data/transport_data.csv")




manipulated_data %>%
  ggplot(aes(x = date, y = running.total)) + geom_line()


transport_data %>%
  ggplot(aes(x = 1, y = number.of.items)) + geom_violin()
