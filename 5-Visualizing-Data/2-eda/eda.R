# Haritsyam Anshari
# CS50R - Problem Set 5 - Question 2: Exploratory Data Analysis, eda.R

# Description: This script performs an exploratory data analysis (EDA)
# comparing Indonesia's BI-7 Day Repo Rate (called BI-Rate as of 2023) and inflation over time
# using data from Excel files with localized (Indonesian) month names.

# --- Load Required Libraries ---
library(readxl)    # For reading Excel (.xlsx) files
library(dplyr)     # For data manipulation
library(lubridate) # For handling and transforming date formats
library(ggplot2)   # For data visualization
library(stringr)   # For text pattern matching and cleaning

# --- Define Indonesian Month Names ---
# Used later to convert Indonesian month names to numerical month values
month_id <- c(
  "Januari","Februari","Maret",
  "April","Mei","Juni",
  "Juli","Agustus","September",
  "Oktober","November","Desember"
)

# --- Read and Clean BI Rate Data ---
bi_rate <- read_excel("BI-Rate.xlsx") |>
  mutate(
    # Extract day number (1–31) from start of 'Tanggal' column
    day = as.numeric(str_extract(Tanggal, "^[0-9]{1,2}")),
    # Extract month name (e.g. "September")
    month_name = str_extract(Tanggal, "[A-Za-z]+"),
    # Match month name to its numeric position in month_id (like "September" -> 9)
    month = match(month_name, month_id),
    # Extract year (like 2025)
    year = as.numeric(str_extract(Tanggal, "[0-9]{4}")),

    # Construct proper Date using year-month-day format
    Date = as.Date(ISOdate(year, month, day)),

    # Remove the "%" symbol from rate values and convert to numeric
    bi_rate = as.numeric(str_replace(`BI-7Day-RR`, "%", ""))
  ) |>
  select(Date, bi_rate) |>

  # Create a month-start column for later joining
  mutate(month_start = floor_date(Date, unit = "month"))

# --- Read and Clean Inflation Data ---
inflation <- read_excel("Inflation.xlsx") |>
  mutate(
    # Extract month name and convert to numeric month
    month_name = str_extract(Periode, "[A-Za-z]+"),
    month = match(month_name, month_id),
    # Extract year (like 2025)
    year = as.numeric(str_extract(Periode, "[0-9]{4}")),

    # Assume day = 1 since inflation is monthly
    Date = as.Date(ISOdate(year, month, 1)),

    # Clean "%" symbol and convert inflation values to numeric
    inflation = as.numeric(str_replace(`Data Inflasi`, "%", ""))
  ) |>
  select(Date, inflation)

# --- Merge BI Rate and Inflation Data ---
# Left join keeps all BI Rate entries and matches them with inflation data
# based on the month (using month_start from BI Rate and Date from inflation)
df <- left_join(bi_rate, inflation, by = c("month_start" = "Date"))

# --- Visualization: Inflation vs BI-Rate Over Time ---
plot <- ggplot(df, aes(x = month_start)) +
  # Line for Inflation
  geom_line(aes(y = inflation, color = "Inflation"), linewidth = 0.5) +
  # Line for BI Rate
  geom_line(aes(y = bi_rate, color = "BI Rate"), linewidth = 0.5) +

  # Set custom colors for lines
  scale_color_manual(values = c("Inflation" = "red", "BI Rate" = "blue")) +

  # Add descriptive labels and legend
  labs(
    title = "Inflation vs BI-Rate",
    x = "Year",
    y = "Percentage (%)",
    color = "Legends"
  ) +

  # Apply a clean minimal theme
  theme_minimal() +
  theme(
    axis.text.x = element_text(size = 10, hjust = 0.8, family = "serif"),
    axis.text.y = element_text(size = 10, family = "serif"),
    axis.title = element_text(size = 10, family = "serif"),
    plot.title = element_text(size = 16, hjust = 0.5, family = "serif"),
    legend.text = element_text(size = 12, family = "serif"),
    legend.title = element_text(size = 14, family = "serif")
  )

# --- Display the Plot ---
print(plot)

# --- Save the Plot as PNG ---
ggsave(
  "visualization.png",
  plot = plot,
  width = 1200,
  height = 900,
  units = "px"
)