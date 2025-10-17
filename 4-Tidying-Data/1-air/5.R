# Haritsyam Anshari
# CS50R - Problem Set 4 - Question 1: Northwest Air, 5.R

library(tidyverse)

# Load the saved air data
load("air.RData")

# For each county, select the record with the highest emissions
air <- air |>
  group_by(county) |>
  slice_max(order_by = emissions) |>
  ungroup()

# Save the summarized data
save(air, file = "5.RData")