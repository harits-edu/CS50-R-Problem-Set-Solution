# Haritsyam Anshari
# CS50R - Problem Set 2 - Question 2: Food Court

# Create a data frame for food menu
food <- data.frame(
  Appetizer = c("Sate Lilit Bali", "Bruschetta"),
  Main = c("Rawon Surabaya", "Paella"),
  Dessert = c("Klepon", "Crème Brûlée"),
  row.names = c("Indo", "Int")
)

# Get the user's input
location <- readline("Would you like Indonesian Cuisine or International Cuisine (Indo/Int)? ")
type <- readline("Would you like an Appetizer, the Main, or a Dessert? ")

# Check input validity and print the recommended dish
if (type %in% colnames(food) & (location %in% rownames(food))) {
  cat("Our Recommended Dish is", food[location, type])
} else {
  print("Invalid option.")
}