# Haritsyam Anshari
# CS50R - Problem Set 4 - Question 1: Zeruda no Densetsu, 2.R

# Load the processed Zelda dataset
load("zelda.RData")

# Group by release year and count the number of releases per year
zelda <- zelda |>
  group_by(year) |>
  summarize(releases = n()) |>
  arrange(desc(releases)) |>
  ungroup()

# Save the summarized dataset
save(zelda, file = "2.RData")