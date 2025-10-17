# Haritsyam Anshari
# CS50R - Problem Set 3 - Question 3: Variations, variations.R

# The problem is way easier than the previous one
# This function picks a random alphabet character
random_character <- function() {
  sample(letters, 1)
}

# This function prints characters one by one with a short delay
print_sequence <- function(length) {
  for (i in 1:length) {
    cat(random_character())
    Sys.sleep(0.25)
  }
}

# Prints
print_sequence(20)