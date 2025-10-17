# Haritsyam Anshari
# CS50R - Problem Set 5 - Question 1: Parked Out By The Lake, parked.R

# Load all necessary libraries
library(tidyverse)
library(readr)
library(stringr)
library(ggplot2)

# Load the song lyrics from text file
song <- read_file("lyrics/is_it_the_answer.txt")

# Clean the text:
# - Remove unwanted punctuation except apostrophes
# - Replace newlines and dashes with spaces
# - Trim extra whitespace between words
song_clean <- song |>
  str_replace_all('[\"(),]', '') |>
  str_replace_all('[\n-]+', ' ') |>
  str_squish()

# Split the cleaned lyrics into words, convert to vector, and capitalize first letters
words_vector <- str_split(song_clean, " ", simplify = TRUE) |>
  as.vector() |>
  str_to_title()

# Create a tibble to count occurrences of each word
# Keep only words appearing at least 4 times and order them by frequency
df <- tibble(word = words_vector) |>
  group_by(word) |>
  summarize(count = n(), .groups = "drop") |>
  filter(count >= 4) |>
  arrange(desc(count))

# Convert 'word' column to a factor to preserve ordering in the plot
df <- df |> mutate(word = factor(word, levels = df$word))

# Create a bar plot showing most frequent words in the lyrics
song_plot <- ggplot(df, aes(x = word, y = count)) +
  geom_col(aes(fill = count), show.legend = FALSE) +
  scale_fill_gradient(low = "red", high = "pink") +
  labs(
    x = "Words",
    y = "Counts",
    title = "Is It The Answer - Word Count"
  ) +
  theme_minimal(base_size = 7) +
  theme(
    axis.text.x = element_text(size = 8, angle = 45, hjust = 0.8, family = "serif"),
    axis.text.y = element_text(size = 10, family = "serif"),
    axis.title = element_text(size = 10, family = "serif"),
    plot.title = element_text(face = "italic", size = 16, hjust = 0.5, family = "serif")
  )

# Display the plot
print(song_plot)

# Save the plot as PNG image
ggsave(
  "lyrics.png",
  plot = song_plot,
  width = 1200,
  height = 900,
  units = "px"
)
