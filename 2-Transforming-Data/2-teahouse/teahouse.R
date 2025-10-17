# Haritsyam Anshari
# CS50R - Problem Set 2 - Question 2: Tea House, teahouse.R

# Create a data frame for tea menu
teaMenu <- data.frame(
  Light = c("chamomile", "green tea"),
  Bold = c("rooibos", "black tea"),
  row.names = c("No", "Yes")
)

# Get the user's input
flavor <- readline("Flavor: ")
caffeine <- readline("Caffeine: ")

# Check input validity and print the recommended tea
if (flavor %in% colnames(teaMenu) & (caffeine %in% rownames(teaMenu))) {
  cat("Recommended tea is:", teaMenu[caffeine, flavor])
} else {
  print("Invalid option.")
}