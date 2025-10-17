# Haritsyam Anshari
# CS50R - Problem Set 2 - Question 1: Librarian, log.R

# STEP 1: Read the data files
# Read book information from 'books.csv'
books <- read.csv("books.csv")

# Read author information from 'authors.csv'
authors <- read.csv("authors.csv")

# STEP 2: Convert data types for consistency
# Ensure that 'year' and 'pages' columns are numeric (not text)
books$year <- as.numeric(books$year)
books$pages <- as.numeric(books$pages)

# STEP 3: Solve each clue
# The Writer — wants all book titles written by Mia Morgan
writersBook <- books$title[books$author == "Mia Morgan"]

# The Musician — wants books published in 1613 with topic "Music"
musiciansBook <- books$title[(books$year == 1613) & (books$topic == "Music")]

# The Traveler — wants books by Lysandra Silverleaf or Elena Petrova, published in 1775
travelersBook <- books$title[
  books$author %in% c("Lysandra Silverleaf", "Elena Petrova") &
  (books$year == 1775)
]

# The Painter — wants books published in 1990 or 1992, with pages between 200–300
paintersBook <- books$title[
  books$year %in% c(1990, 1992) &
  (books$pages > 200 & books$pages < 300)
]

# The Scientist — wants books whose title contains the phrase "Quantum Mechanics"
scientistsBook <- books$title[grepl("Quantum Mechanics", books$title)]

# The Teacher — wants books by authors from Zenthia and published in years containing "17"
# Find all authors from hometown "Zenthia"
teachersAuthor <- authors$author[authors$hometown == "Zenthia"]

# Then find all matching book titles
teachersBook <- books$title[
  (books$author %in% teachersAuthor) &
  (grepl("17", books$year))
]

# STEP 4: Prepare and write the results
# Create an empty character vector for storing answer lines
lines <- character(6)

# Combine each result into a formatted line of text
lines[1] <- paste("The Writer is looking for:", writersBook)
lines[2] <- paste("The Musician is looking for:", musiciansBook)
lines[3] <- paste("The Traveler is looking for:", travelersBook)
lines[4] <- paste("The Painter is looking for:", paintersBook)
lines[5] <- paste("The Scientist is looking for:", scientistsBook)
lines[6] <- paste("The Teacher is looking for:", teachersBook)

# Save all answers into 'answers.txt' file
writeLines(lines, "answers.txt")