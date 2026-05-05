# Load the health expenditure data and use querychat_app() to launch a querychat app
# for the health expenditure data
#
# then, experiment with the app: ask questions, run queries, etc.

library(querychat)

health_exp <- readr::read_csv(
  here::here("data/health-expenditure.csv"),
  show_col_types = FALSE
)

# Launch querychat with the health expenditure data
___
