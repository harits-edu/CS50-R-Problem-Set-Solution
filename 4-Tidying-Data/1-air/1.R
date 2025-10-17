# Haritsyam Anshari
# CS50R - Problem Set 4 - Question 1: Northwest Air, 1.R

library(tidyverse)

# Read the CSV file
air <- read_csv("air.csv")

# Select and rename important columns
air <- air |>
  select(
    c(
      state = State,
      county = `State-County`,
      pollutant = POLLUTANT,
      emissions = `Emissions (Tons)`,
      level_1 = `SCC LEVEL 1`,
      level_2 = `SCC LEVEL 2`,
      level_3 = `SCC LEVEL 3`,
      level_4 = `SCC LEVEL 4`
    )
  )

# Save the cleaned data as .RData for later use
save(air, file = "air.RData")