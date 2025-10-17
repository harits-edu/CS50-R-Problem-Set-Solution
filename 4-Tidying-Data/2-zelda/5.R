# Haritsyam Anshari
# CS50R - Problem Set 4 - Question 1: Zeruda no Densetsu, 5.R

# Load the processed Zelda dataset
load("zelda.RData")

# Add a column to mark titles with more than one producer
# str_count(producers, ",") counts commas in the 'producers' field
# If there's at least one comma, it means multiple producers are listed
zelda <- zelda |>
  mutate(
    # This line puts TRUE/FALSE on doubleprod
    doubleprod = str_count(producers, ",") >= 1
  ) |>
  # For each title, take the earliest release year
  group_by(title) |>
  slice_min(order_by = year) |>
  # Keep only titles with multiple producers
  filter(doubleprod == TRUE) |>
  # Remove the helper column before saving
  select(-doubleprod) |>
  # Arrange for readability
  arrange(year, title, system)

# Save the filtered dataset
save(zelda, file = "5.RData")