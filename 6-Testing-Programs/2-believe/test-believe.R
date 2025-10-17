# Haritsyam Anshari
# CS50R - Problem Set 6 - Question 2: Can You Belive in Machines, test-believe.R

# Loads the libraries
library("testthat")
source("believe.R")

# Tests if all Day, Month, and Year is available
test_that("`Indonesia Date Converter`: Convert Day Month Year to YYYY-MM-DD", {
  expect_equal(convert_date("15 Oktober 2025"), as.Date("2025-10-15"))
  expect_equal(convert_date("17 Agustus 1945"), as.Date("1945-08-17"))
})

# Tests something if the day isn't available
test_that("`IDC`: If the input is Month Year, Day equals 1", {
  expect_equal(convert_date("Oktober 2025"), as.Date("2025-10-01"))
  expect_equal(convert_date("Agustus 1945"), as.Date("1945-08-01"))
})

# Tests if only the year is available
test_that("`IDC`: If the input is Year, Day and Month equals 1", {
  expect_equal(convert_date("2025"), as.Date("2025-01-01"))
  expect_equal(convert_date("1945"), as.Date("1945-01-01"))
})

# Tests other possibility that still accepted
test_that("`IDC`: Other checkings", {
  expect_equal(convert_date("15 2025"), as.Date("2025-01-01"))
  expect_equal(convert_date("17 1945"), as.Date("1945-01-01"))
})
