# Reddit NLP in R: Modeling Perfectionism Discourse in STEM Communities

This repository contains the data analysis and visualization pipeline for the FIE 2025 paper:

**"Modeling Expressions of Perfectionism in Student Social Media Communities Using Machine Learning"**  
Authors: Haleh Barmaki Brotherton

We analyze Reddit posts from engineering and computing students using a Frost-based dictionary and logistic regression models. Our goal is to explore how adaptive and maladaptive perfectionism traits are expressed and co-occur in online communities, and visualize these relationships using Epistemic Network Analysis (ENA).

---

## Project Goals

- Apply the **Frost Multidimensional Perfectionism Scale (FMPS)** to Reddit discourse using a keyword-based dictionary
- Train logistic regression classifiers to model perfectionism traits from text
- Compare co-occurrence patterns of perfectionism constructs across subreddits
- Visualize patterns using **Epistemic Network Analysis (ENA)** with `widyr`, `igraph`, and `ggraph`

---

## Theoretical Framework

We operationalize perfectionism using FMPS, with six dimensions:
- **Concern Over Mistakes (CM)**
- **Doubts About Actions (DA)**
- **Parental Expectations (PE)**
- **Parental Criticism (PC)**
- **Personal Standards (PS)**
- **Organization (O)**

---

## Folder Structure

```bash
reddit-perfectionism-nlp/
├── README.md
├── reddit-nlp.Rproj
├── frost_dictionary.csv
├── scripts/
│   ├── 01_scrape_reddit.R
│   ├── 02_clean_filter.R
│   ├── 03_dictionary_tagging.R
│   ├── 04_train_classifier.R
│   ├── 05_ena_networks.R
│   └── 06_plot_visuals.R
├── data/
│   └── reddit_posts.csv
├── results/
│   ├── ena_engineering.png
│   ├── ena_programming.png
│   └── tag_frequencies.csv
├── appendix/
│   ├── example_posts_table.csv
│   └── frost_items_table.csv

```bash

#R Packages Used
quanteda
tidyverse (dplyr, readr, tidyr, purrr)
tidymodels + textrecipes
widyr
igraph + ggraph

## Method Summary
Reddit posts were collected from: r/engineeringstudents, r/programming, and r/perfectionism

Posts were filtered using FMPS-derived keywords (see frost_dictionary.csv)

Each post was either manually labeled or automatically tagged using quanteda

Logistic regression models were trained using tidymodels to predict FMPS traits

Co-occurrence networks of predicted traits were calculated and visualized using ENA

#Example Outputs
results/ena_engineering.png → Dense co-occurrence between CM, PS, and O

results/ena_programming.png → Sparser co-occurrence; lighter presence of O

tag_frequencies.csv → Frequency counts for each FMPS dimension


#Acknowledgments
Thanks to Tim Ransom for the conceptual work behind Computer Scientists' Identity Reseaech.