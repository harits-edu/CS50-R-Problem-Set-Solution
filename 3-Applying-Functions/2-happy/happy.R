# Haritsyam Anshari
# CS50R - Problem Set 3 - Question 2: Happy, happy.R

# Function to calculate happiness score for a given country
predictHappiness <- function(df, country) {

  # Combine all components into one happiness score
  # (yeah, this could definitely be done in a cleaner way)
  df$happy <- df$gdp + df$support + df$life_expectancy + df$freedom + df$generosity + df$corruption + df$residual

  # Return the happiness score for the selected country
  return (df$happy[df$country == country])
}

# Read CSV files for each year into a list
# List is one dimensional, but it can contain many types of data
yearList <- list(
  y2020 = read.csv("2020.csv"),
  y2021 = read.csv("2021.csv"),
  y2022 = read.csv("2022.csv"),
  y2023 = read.csv("2023.csv"),
  y2024 = read.csv("2024.csv")
)

# Ask user for input country
country <- readline("Country: ")

# Print happiness results for each year
for (i in 1:5) {
  # [[]] Double brackets to access a list' item, keep this in mind
  happy <- round(predictHappiness(yearList[[i]], country), 2)

  # Check if data for the country is available that year
  if (length(happy) == 0 || is.na(happy)) {
    cat(country, " (", i + 2019, "): Unavailable\n", sep = "")
  } else {
    cat(country, " (", i + 2019, "): ", happy, "\n", sep = "")
  }
}