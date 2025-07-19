# 02_clean_filter.R

install.packages(c("readr", "dplyr"))
library(readr)
library(dplyr)

# Load manually coded Reddit posts
data <- read_csv("~/Downloads/frost_filtered_full_coded.csv") %>%
  mutate(post_id = row_number())

# (Optional) inspect structure
glimpse(data)
