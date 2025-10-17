# Haritsyam Anshari
# CS50R - Problem Set 4 - Question 1: Northwest Air, 7.R

library(tidyverse)

# Load the saved air data
load("air.RData")

# Select relevant columns and summarize total emissions by source and pollutant
air <- air |>
  select(
    c(
      source = level_1,
      pollutant,
      emissions
    )
  ) |>
  group_by(source, pollutant) |>
  summarize(emissions = sum(emissions), .groups = "drop") |>
  arrange(source, pollutant) |>
  ungroup()

# Save the summarized data
save(air, file = "7.RData")