# Haritsyam Anshari
# CS50R - Problem Set 4 - Question 1: Zeruda no Densetsu, 4.R

# Load the processed Zelda dataset
load("zelda.RData")

# Standardize producer names containing "Shigeru Miyamoto"
# This ensures any variation (e.g., "Miyamoto, Shigeru") is labeled consistently
zelda$producers[str_detect(zelda$producers, "Shigeru Miyamoto")] <- "Shigeru Miyamoto"

# For each title, take the earliest release year
# Keep only entries produced by Shigeru Miyamoto
# Then arrange the results by year, title, and system
zelda <- zelda |>
  group_by(title) |>
  slice_min(order_by = year) |>
  filter(producers == "Shigeru Miyamoto") |>
  arrange(year, title, system)

# Save the filtered and arranged dataset
save(zelda, file = "4.RData")