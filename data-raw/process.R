# data-raw/process.R
# Data import and processing pipeline

library(readr)
library(readxl)

pendulum <- read_csv("data-raw/pendulum data.csv")
demographics <- read_excel("data-raw/Demographics.xlsx")

# Data processing code here...

# This should be the last line
devtools::use_data(pendulum, demographics, overwrite = TRUE)
