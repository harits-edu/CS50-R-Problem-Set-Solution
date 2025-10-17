# Haritsyam Anshari
# CS50R - Problem Set 2 - Question 3: On Time, ontime.R

# Asks user for the input
route <- readline("Enter the route: ")

# Merge both CSV files
rail <- read.csv("rail.csv")
bus <- read.csv("bus.csv")
mode <- rbind(rail, bus)

# Convert to integer for reliability column
mode$numerator <- as.integer(mode$numerator)
mode$denominator <- as.integer(mode$denominator)

# Add another column of reliability
mode$reliability <- mode$numerator / mode$denominator

# Calculate mean (This kind of writing code in R is genius FR)
meanPeak <- mean(mode$reliability[(mode$peak == "PEAK") & (mode$route == route)])
meanOffPeak <- mean(mode$reliability[(mode$peak == "OFF_PEAK") & (mode$route == route)])

# Prints the results
cat("On time ", round(meanPeak, 2) * 100, "% of the time during peak hours.\n", sep = "")
cat("On time ", round(meanOffPeak, 2) * 100, "% of the time during off-peak hours.", sep = "")