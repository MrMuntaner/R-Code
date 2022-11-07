library("tidyverse")

transport_data <- read_csv("data/transport_data.csv")

by_receive_city <- transport_data %>%
  group_by(receiver.country, receiver.city) %>%
  select(date, number.of.items)

by_receive_city %>%
  summarise(observations = n())

by_receive_city %>%
  mutate(percent.of.items = 100 * {number.of.items / sum(number.of.items)})

by_receive_city %>%
  filter(cumany(number.of.items > 453))
