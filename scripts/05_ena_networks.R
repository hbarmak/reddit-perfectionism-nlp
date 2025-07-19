# 05_ena_networks.R

library(dplyr)
library(tidyr)
library(purrr)
library(widyr)

# Build long format for co-occurrence analysis
predicted_targets <- paste0(frost_targets, "_pred")

frost_long <- data %>%
  select(post_id, subreddit, all_of(predicted_targets)) %>%
  pivot_longer(cols = all_of(predicted_targets), names_to = "code", values_to = "present") %>%
  filter(present == TRUE)

# Pairwise counts by subreddit
subreddit_pairs <- frost_long %>%
  group_split(subreddit) %>%
  map_df(~{
    df <- .
    pairwise_count(df, code, post_id, sort = TRUE, upper = FALSE) %>%
      mutate(subreddit = unique(df$subreddit))
  })
