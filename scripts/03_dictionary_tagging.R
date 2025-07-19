# 03_dictionary_tagging.R

install.packages("quanteda")
library(quanteda)
library(readr)
library(dplyr)



# Load FMPS dictionary
frost_dict_df <- read_csv("frost_dictionary.csv")
frost_dict_list <- split(frost_dict_df$keyword, frost_dict_df$dimension)
frost_dict <- dictionary(frost_dict_list)

# Tokenize and apply dictionary
tokens <- tokens(data$text, remove_punct = TRUE)
dfm <- dfm(tokens)
tagged <- dfm_lookup(dfm, frost_dict)

# Add tagged features to data
data <- bind_cols(data, as.data.frame(tagged))
