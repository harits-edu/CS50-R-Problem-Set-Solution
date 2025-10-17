# Haritsyam Anshari
# CS50R - Problem Set 4 - Question 1: Zeruda no Densetsu, 1.R

library(tidyverse)

# Read the Zelda dataset from CSV
zelda <- read_csv("zelda.csv")

# Transform and clean the data
zelda <- zelda |>
  # Each unique value in 'role' becomes a new column (e.g., director, producer, composer)
  # The corresponding 'names' fill those new columns
  # 'title' and 'release' remain as identifying columns
  pivot_wider(
    id_cols = c(title, release),
    names_from = role,
    values_from = names
  ) |>
  # Convert all column names to lowercase for consistency
  rename_with(tolower) |>
  # Split the "release" column (which has values like "1986 - NES")
  # into two separate columns: "year" and "system"
  # The separator " - " defines where to split the text
  # remove = TRUE means the original "release" column will be dropped
  separate(
    col = release,
    into = c("year", "system"),
    sep = " - ",
    remove = TRUE
  )

# Save the cleaned and reshaped Zelda dataset for later use
save(zelda, file = "zelda.RData")