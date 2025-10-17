# Haritsyam Anshari
# CS50R - Problem Set 3 - Question 1: PDX Carpet, carpet.R

# Function to calculate growth rate
# Returns growth rate value used later for prediction
calculate_growth_rate <- function(years, visitors) {
  last <- length(visitors)
  growth_rate <- (visitors[last] - visitors[1]) / (years[last] - years[1])
  return (growth_rate)
}

# Function to predict number of visitors after the last recorded year
predict_visitors <- function(years, visitors, year) {
  growth_rate <- calculate_growth_rate(years, visitors)
  last <- length(visitors)

  # Calculate difference between inputted year and last data year
  delta_year <- year - years[last]

  # Apply linear prediction formula
  predicted_visitors <- visitors[last] + growth_rate * delta_year
  return (predicted_visitors)
}

# Main program
# Read CSV file containing year and visitors data
visitors <- read.csv("visitors.csv")

# Ask user to input target year for prediction
year <- as.integer(readline("Year: "))

# Call the prediction function
predicted_visitors <- predict_visitors(visitors$year, visitors$visitors, year)

# Print the predicted visitors with proper format
cat(paste0(predicted_visitors, " million visitors\n"))