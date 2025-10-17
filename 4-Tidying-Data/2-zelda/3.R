# Haritsyam Anshari
# CS50R - Problem Set 4 - Question 1: Zeruda no Densetsu, 3.R

# Load the processed Zelda dataset
load("zelda.RData")

# For each title, select the earliest release year
# Then arrange results by year, title, and system for readability
zelda <- zelda |>
  group_by(title) |>
  slice_min(order_by = year) |>
  arrange(year, title, system)

# Save the filtered and arranged dataset
save(zelda, file = "3.RData")