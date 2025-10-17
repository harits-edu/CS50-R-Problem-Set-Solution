# Haritsyam Anshari
# CS50R - Problem Set 1 - Question 3: Big 5, big5.R

# Read the TSV file (tab-separated values) named "tests.tsv" into a data frame called 'personality'
# - sep = "\t" means values are separated by tabs
# - header = TRUE means the first row contains column names
# - stringsAsFactors = FALSE keeps string data as text (not converted to factors automatically)
personality <- read.table(
  "tests.tsv",
  sep = "\t",
  header = TRUE,
  stringsAsFactors = FALSE
)

# Convert the 'gender' column to a factor (categorical variable)
# Assign readable labels for each possible value:
# 1 = Unanswered, 2 = Male, 3 = Female, 4 = Other
personality$gender <- factor(
  personality$gender,
  labels = c("Unanswered", "Male", "Female", "Other")
)

# Calculate each of the Big Five personality traits as the average of 3 question scores.
# Divide the total score (sum of 3 questions) by 15 (since each question likely ranges 1–5),
# then round to 2 decimal places for neatness.

# Extroversion = average of E1, E2, E3
personality$extroversion <- round(rowSums(personality[c("E1", "E2", "E3")]) / 15, 2)

# Neuroticism = average of N1, N2, N3
personality$neuroticism <- round(rowSums(personality[c("N1", "N2", "N3")]) / 15, 2)

# Agreeableness = average of A1, A2, A3
personality$agreeableness <- round(rowSums(personality[c("A1", "A2", "A3")]) / 15, 2)

# Conscientiousness = average of C1, C2, C3
personality$conscientiousness <- round(rowSums(personality[c("C1", "C2", "C3")]) / 15, 2)

# Openness = average of O1, O2, O3
personality$openness <- round(rowSums(personality[c("O1", "O2", "O3")]) / 15, 2)

# Save the resulting data frame (with new columns) as a CSV file named "analysis.csv"
# - row.names = FALSE ensures row numbers aren’t included in the file
write.csv(personality, "analysis.csv", row.names = FALSE)