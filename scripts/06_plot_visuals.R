# 06_plot_visuals.R

# Load libraries
library(igraph)
library(ggraph)
library(dplyr)

# Function to plot ENR graph by subreddit
plot_enr_by_subreddit <- function(subreddit_name, color_choice) {
  edges <- subreddit_pairs %>% filter(subreddit == subreddit_name)
  nodes <- frost_long %>%
    filter(subreddit == subreddit_name) %>%
    count(code, name = "freq") %>%
    rename(name = code)
  
  if (nrow(edges) > 0) {
    g <- graph_from_data_frame(edges, directed = FALSE, vertices = nodes)
    ggraph(g, layout = "fr") +
      geom_edge_link(aes(width = n), alpha = 0.8, color = "gray60") +
      geom_node_point(aes(size = freq), color = color_choice) +
      geom_node_text(aes(label = gsub("_pred", "", name)), repel = TRUE, size = 5) +
      labs(
        title = paste("ENR –", subreddit_name),
        size = "Node Frequency",
        edge_width = "Co-occurrence"
      ) +
      scale_size_continuous(range = c(4, 12)) +
      theme_void() +
      theme(plot.title = element_text(hjust = 0.5))
  } else {
    message(paste("💔 No co-occurrences for", subreddit_name))
  }
}

# Optional: Create results folder if missing
if (!dir.exists("results")) dir.create("results")

# Save ENR plot to PDF (or use PNG if preferred)
pdf("results/ena_engineering.pdf", width = 10, height = 8)
plot_enr_by_subreddit("engineeringstudents", "steelblue")
dev.off()

pdf("results/ena_programming.pdf", width = 10, height = 8)
plot_enr_by_subreddit("programming", "darkred")
dev.off()
