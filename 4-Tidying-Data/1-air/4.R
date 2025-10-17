# Haritsyam Anshari
# CS50R - Problem Set 4 - Question 1: Northwest Air, 4.R

library(tidyverse)

# Load the saved air data
load("air.RData")

# Filter for Marion County, Oregon and sort by emissions (descending)
air <- air |>
  filter(county == "OR - Marion") |>
  arrange(desc(emissions))

# Save the filtered and arranged data
save(air, file = "4.RData")