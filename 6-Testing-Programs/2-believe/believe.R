# Haritsyam Anshari
# CS50R - Problem Set 6 - Question 2: Can You Belive in Machines, believe.R

# I actually use the same idea as in EDA, which analyze
# Data from Bank Indonesia ( and now focuses on the date format)
# Loads the libraries
library("dplyr")
library("stringr")

# The main function to convert Indonesian Date
convert_date <- function(date) {
  # Includes all the Indonesian month names
  month_id <- c(
    "Januari", "Februari", "Maret",
    "April", "Mei", "Juni",
    "Juli", "Agustus", "September",
    "Oktober", "November", "Desember"
  )

  # Using regex to extract all date elements
  day <- as.numeric(str_extract(date, "^[0-9]{1,2}(?=\\s*[A-Za-z])"))
  day <- ifelse(is.na(day), 1, day)
  month_name <- str_extract(date, "[A-Za-z]+")
  month <- match(month_name, month_id)
  month <- ifelse(is.na(month), 1, month)
  year <- as.numeric(str_extract(date, "[0-9]{4}$"))
  Date <- as.Date(ISOdate(year, month, day))
  return (Date)

}

# Input from the user
date = readline("Enter your date in Indonesian: ")
date <- convert_date(date)
print(date)
