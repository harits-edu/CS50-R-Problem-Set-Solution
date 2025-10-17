# Haritsyam Anshari
# CS50R - Problem Set 4 - Question 1: Northwest Air, 6.R

library(tidyverse)

# Load the saved air data
load("air.RData")

# Summarize total emissions by pollutant and sort from highest to lowest
air <- air |>
  group_by(pollutant) |>
  summarize(emissions = sum(emissions)) |>
  arrange(desc(emissions)) |>
  ungroup()

# Save the summarized data
save(air, file = "6.RData")