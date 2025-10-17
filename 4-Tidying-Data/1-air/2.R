# Haritsyam Anshari
# CS50R - Problem Set 4 - Question 1: Northwest Air, 2.R

library(tidyverse)

# Load the saved air data
load("air.RData")

# Convert emissions to integer
air$emissions <- as.integer(air$emissions)

# Arrange data in descending order of emissions
air <- air |>
  arrange(desc(emissions))

# Save the arranged data
save(air, file = "2.RData")