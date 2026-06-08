# Infosys-Stock-Analysis
Statistical Analysis of Infosys Stock Market Trends using R

# 📊 Statistical Analysis of Infosys Stock Market Trends

![R](https://img.shields.io/badge/R-4.5.3-blue) 
![Dataset](https://img.shields.io/badge/Dataset-NSE%20Kaggle-green)

## 📌 Overview
A comprehensive statistical analysis of Infosys Limited stock prices from 2010 to 2023, using historical intraday data sourced from NSE via Kaggle. The analysis covers time series decomposition, regression, ANOVA, hypothesis testing, and post-hoc analysis.

## ✨ Analysis Covered
- 📈 Time Series Decomposition (Trend, Seasonal, Cyclic)
- 📉 Regression Analysis (Volume vs Closing Price)
- 📊 ANOVA (Quarterly Price Comparison)
- 🔬 Hypothesis Testing (T-test, F-test)
- 🧪 Chi-Square Test (Price Movement vs Quarter)
- 📐 Post-Hoc Tukey Test

## 🛠️ Tech Stack
| Category | Tools |
|----------|-------|
| Language | R 4.5.3 |
| Libraries | ggplot2, dplyr, forecast, tseries |
| Dataset | Infosys Limited Intraday Price — NSE, Kaggle |
| Report | R Markdown (HTML) |

## 📂 Project Structure

Infosys-Stock-Analysis/
│
├── data/
│   └── infosys_stock.csv
├── plots/
│   ├── closing_price_trend.png
│   ├── time_series_decomposition.png
│   ├── regression_volume_close.png
│   ├── anova_quarterly.png
│   └── tukey_posthoc.png
├── infosys_analysis.R
├── Infosys Stock Market Analysis.Rmd
└── README.md

## 📊 Key Findings
- Infosys stock showed **consistent long-term growth** from INR 240 to INR 1500+
- **Significant negative relationship** between trading volume and closing price
- **Q4 prices significantly higher** than Q2 (Tukey p = 0.0004)
- **Substantial price growth** confirmed between 2010-2016 vs 2017-2023 periods
- Price movement direction shows **no significant quarterly dependency**

## ⚙️ How to Run
```r
# Install required packages
install.packages(c("ggplot2", "dplyr", "forecast", "tseries", "rmarkdown"))

# Run analysis
source("infosys_analysis.R")

# Generate report
rmarkdown::render("Infosys Stock Market Analysis.Rmd")
```

## 📄 License
CC BY 4.0 — Creative Commons Attribution 4.0 International
