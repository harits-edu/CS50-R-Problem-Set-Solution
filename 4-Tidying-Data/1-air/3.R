# Haritsyam Anshari
# CS50R - Problem Set 4 - Question 1: Northwest Air, 3.R

library(tidyverse)

# Load the saved air data
load("air.RData")

# Filter data for Marion County, Oregon
air <- air |>
  filter(county == "OR - Marion")

# Save the filtered data
save(air, file = "3.RData")