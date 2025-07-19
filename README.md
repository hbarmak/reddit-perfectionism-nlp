# Reddit Perfectionism NLP + ENA Analysis

This project explores perfectionism-related discourse on Reddit using natural language processing (NLP), dictionary-based classification, and Epistemic Network Analysis (ENA). The goal was to identify and visualize latent perfectionism dimensions from user-generated text in engineering-related subreddits.

## What I Did

- Cleaned and structured Reddit post data annotated with Frost’s Multidimensional Perfectionism Scale (FMPS)
- Applied dictionary-based tagging and logistic regression classification using `tidymodels` and `textrecipes`
- Thresholded and binary-tagged posts based on predicted probability
- Visualized the cognitive co-occurrence structure of perfectionism traits using ENA-style network graphs with `igraph` and `ggraph`
- Focused on three Frost dimensions:  
  - Concern Over Mistakes  
  - Personal Standards  
  - Organization

## Key Techniques

- Dictionary tagging with `quanteda`
- Logistic regression with `tidymodels`
- Tokenization, TF-IDF, and vectorization
- Network co-occurrence analysis (`widyr`, `igraph`)
- Epistemic-style graph plotting with `ggraph`

## Project Structure
├── data/ # Input CSVs (not publicly shared)
├── results/ # Output PDFs and visualizations
├── scripts/ # All R scripts (dictionary tagging, modeling, ENA plotting)
├── appendix/ # Supporting materials
├── reddit-perfectionism-nlp.Rproj
└── README.md


## Sample Output

> Example ENA-style network visualizing predicted perfectionism traits in `r/engineeringstudents`:

![ENA graph](/results/ena_engineering.pdf)

## Future Work

- Expand to additional subreddits and Frost dimensions
- Explore unsupervised clustering and topic modeling
- Deploy an interactive Shiny dashboard for real-time analysis

---

Created as part of a PhD research stream on perfectionism, engineering education, and psychological assessment.

