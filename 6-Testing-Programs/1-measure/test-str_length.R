# Haritsyam Anshari
# CS50R - Problem Set 6 - Question 1: Measure Twice, test-str.length.R

# Loads up the libraries
library("stringr")
library("testthat")

# Test group: Check the core function of str_length (counting characters).
test_that("`str_length` - number of characters", {
  expect_equal(str_length("H"), 1)
  expect_equal(str_length("Harits"), 6)
})

# Test group: Ensure non-alphabetical characters (like punctuation and spaces) are counted.
test_that("`str_length` - expected output of non-alphabetical char", {
  # Punctuation and spaces are counted as individual characters.
  expect_equal(str_length("Hello, Harits!"), 14)
  # Emojis are treated as a single codepoint by stringr (one character).
  expect_equal(str_length("Hi to the World 👋"), 17)
})

# Test group: Verify behavior with special R values like NA, NaN, and Inf.
test_that("`str_length` - expected output for special values", {
  # NA (missing value) should always propagate to NA.
  expect_true(is.na(str_length(NA)))

  # NaN is coerced to the string "NaN", which has a length of 3.
  expect_equal(str_length(NaN), 3)

  # Directly confirming the string "NaN" length is 3.
  expect_equal(str_length("NaN"), 3)

  # Numerical values like Inf are coerced to character "Inf" (length 3).
  expect_equal(str_length(Inf), 3)

  # Numerical values like -Inf are coerced to character "-Inf" (length 4).
  expect_equal(str_length(-Inf), 4)
})

# Test group: Check if the function works correctly with a vector of strings.
test_that("`str_length` - vector and dataframes", {
  # Tests vector
  # Emoji counts as 1 character
  vector <- c("Hello", "Hi 👋", "World!")
  expect_equal(str_length(vector), c(5, 4, 6))

  # Example check for data frame column (This just doesn't work Lol):
  # df <- data.frame(name = c("A", "B"))
  # expect_equal(str_length(df$name), c(1, 1))
})