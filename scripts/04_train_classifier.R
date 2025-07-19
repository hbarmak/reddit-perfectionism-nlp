# 04_train_classifier.R

install.packages(c("tidymodels", "textrecipes"))
library(tidymodels)
library(textrecipes)

# Define dimensions to model
frost_targets <- c("Concern_Over_Mistakes", "Personal_Standards", "Organization")

# Create binary labels from manual codes
for (target in frost_targets) {
  code_text <- gsub("_", " ", target)
  data[[target]] <- data$Frost_Code == code_text
}
data[frost_targets] <- lapply(data[frost_targets], as.factor)

# Logistic regression pipeline
train_predict_model <- function(target_var, data) {
  model_data <- data %>%
    select(text, !!sym(target_var)) %>%
    rename(label = !!sym(target_var))
  
  split <- initial_split(model_data, prop = 0.8, strata = label)
  train_data <- training(split)
  test_data <- testing(split)
  
  rec <- recipe(label ~ text, data = train_data) %>%
    step_tokenize(text) %>%
    step_tokenfilter(text, max_tokens = 1000) %>%
    step_tfidf(text)
  
  mod <- logistic_reg() %>%
    set_engine("glm") %>%
    set_mode("classification")
  
  wf <- workflow() %>%
    add_recipe(rec) %>%
    add_model(mod)
  
  fit <- wf %>% fit(data = train_data)
  
  predict(fit, new_data = model_data, type = "prob") %>%
    bind_cols(predict(fit, new_data = model_data)) %>%
    bind_cols(model_data) %>%
    mutate(post_id = row_number())
}

# Train + store all models
all_preds <- lapply(frost_targets, train_predict_model, data = data)
names(all_preds) <- frost_targets

# Threshold predictions
threshold <- 0.2
for (target in names(all_preds)) {
  pred_binary <- all_preds[[target]]$.pred_TRUE > threshold
  pred_colname <- paste0(target, "_pred")
  data[[pred_colname]] <- pred_binary
}
