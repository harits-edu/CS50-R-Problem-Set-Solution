# Haritsyam Anshari
# CS50R - Problem Set 1 - Question 2: art.frame, art.R

# Create a data frame named 'art' (Data Frame is a "list" of "vectors")
# Each column (A–E) represents a vertical part of the image (It's a vector)
# Each row represents one horizontal line of the drawing (It's a list)
art <- data.frame(
  A = c(" ", " ", " ", " ", " "),   # Column A (mostly empty)
  B = c(" ", "*", " ", "#", " "),   # Column B with * and #
  C = c(" ", " ", " ", "#", " "),   # Column C with a single #
  D = c(" ", "*", " ", "#", " "),   # Column D with * and #
  E = c(" ", " ", " ", " ", " ")    # Column E (empty)
)

# Print the 'art' data frame to display the ASCII art
print(art)