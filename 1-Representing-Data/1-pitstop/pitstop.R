# Haritsyam Anshari
# CS50R - Problem Set 1 - Question 1: Pitstop, pitstop.R

# Prompt the user to enter the name or path of the CSV file
track <- readline("Enter the CSV track file: ")

# Read the CSV file into a data frame
trackCSV <- read.csv(track)

# Get the number of laps (number of rows in the CSV file)
numLaps <- nrow(trackCSV)
print(numLaps)  # Print the total number of laps

# Find the shortest lap time (minimum value in the 'time' column)
shortestLap <- min(trackCSV$time)
print(shortestLap)  # Print the shortest lap time

# Find the longest lap time (maximum value in the 'time' column)
longestLap <- max(trackCSV$time)
print(longestLap)  # Print the longest lap time

# Calculate the total lap time (sum of all 'time' values)
totalLap <- sum(trackCSV$time)
print(totalLap)  # Print the total time of all laps