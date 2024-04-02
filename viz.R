library(tidyverse)
library(peopleanalyticsdata)

head(employee_survey)

grp_means <- employee_survey |>
  group_by( Happiness ) |>
  summarize( ben = mean( Ben1 + Ben2 + Ben3 ),
             work = mean( Work1 + Work2 + Work3 ),
             man = mean( Man1 + Man2 + Man3 ),
             car = mean( Car1 + Car2 + Car3 + Car4 )) |>
  pivot_longer(
    cols = !Happiness,
    names_to = "category",
    values_to = "mean_of_total"
  )

head(grp_means)

grp_means |>
  ggplot(aes( x = Happiness, y = mean_of_total ) ) +
  geom_bar(stat = "identity") +
  facet_wrap( vars( category ) )