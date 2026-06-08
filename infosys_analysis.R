# Install packages 
install.packages("readxl")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tseries")
install.packages("forecast")

# Load libraries
library(readxl)
library(ggplot2)
library(dplyr)
library(tseries)
library(forecast)

# ---------------------------------------------------------------


# Load dataset
df <- read.csv("data/infosys_stock.csv")

# Check data
head(df)
str(df)

sapply(df, class)

# Fix data types
df$Date <- as.Date(df$Date)
df$Open <- as.numeric(df$Open)
df$High <- as.numeric(df$High)
df$Low <- as.numeric(df$Low)
df$Close <- as.numeric(df$Close)
df$Adj.Close <- as.numeric(df$Adj.Close)
df$Volume <- as.numeric(df$Volume)

# Verify
str(df)

sapply(df, class)

# ---------------------------------------------------------------


# Check NA values
colSums(is.na(df))

# Remove NA rows
df <- na.omit(df)

# Verify
nrow(df)
colSums(is.na(df))

# ---------------------------------------------------------------


# Time Series Plot - Closing Price
ggplot(df, aes(x = Date, y = Close)) +
  geom_line(color = "steelblue") +
  labs(title = "Infosys Stock Closing Price (2010-2023)",
       x = "Year", y = "Closing Price (INR)") +
  theme_minimal()

# Create plots folder
dir.create("plots")

# Save plot
ggsave("plots/closing_price_trend.png", width = 10, height = 5)

# ---------------------------------------------------------------


# Time Series Decomposition
ts_data <- ts(df$Close, start = c(2010, 1), frequency = 252)

decomp <- decompose(ts_data)
plot(decomp)

png("plots/time_series_decomposition.png", width = 800, height = 600)
plot(decomp)
dev.off()

# ---------------------------------------------------------------


# Linear Regression - Volume vs Close Price
model <- lm(Close ~ Volume, data = df)
summary(model)

# Plot
ggplot(df, aes(x = Volume, y = Close)) +
  geom_point(color = "steelblue", alpha = 0.3) +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Regression: Volume vs Closing Price",
       x = "Volume", y = "Closing Price (INR)") +
  theme_minimal()

# Save
ggsave("plots/regression_volume_close.png", width = 10, height = 5)

summary(model)

# ---------------------------------------------------------------

# Add Quarter column
df$Quarter <- quarters(df$Date)

# ANOVA
anova_model <- aov(Close ~ Quarter, data = df)
summary(anova_model)

# Boxplot
ggplot(df, aes(x = Quarter, y = Close, fill = Quarter)) +
  geom_boxplot() +
  labs(title = "ANOVA: Closing Price by Quarter",
       x = "Quarter", y = "Closing Price (INR)") +
  theme_minimal()

# Save
ggsave("plots/anova_quarterly.png", width = 8, height = 5)

# ---------------------------------------------------------------


# T-test - First half vs Second half of data
half <- nrow(df) %/% 2
first_half <- df$Close[1:half]
second_half <- df$Close[(half+1):nrow(df)]

t_result <- t.test(first_half, second_half)
print(t_result)

# F-test (variance comparison)
f_result <- var.test(first_half, second_half)
print(f_result)

# Chi-square - Price Movement (Up/Down)
df$Movement <- ifelse(df$Close > df$Open, "Up", "Down")
movement_table <- table(df$Movement, df$Quarter)
print(movement_table)

chi_result <- chisq.test(movement_table)
print(chi_result)

# ---------------------------------------------------------------


# Post-hoc Tukey Test
tukey_result <- TukeyHSD(anova_model)
print(tukey_result)

# Plot
plot(tukey_result)

# Save
png("plots/tukey_posthoc.png", width = 800, height = 500)
plot(tukey_result)
dev.off()

# ---------------------------------------------------------------


