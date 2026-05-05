library(ellmer)
library(dplyr)

health_exp <- readr::read_csv(
  here::here("data/health-expenditure.csv"),
  show_col_types = FALSE
)

# Step 1: Write a function that takes a country name and year and returns a
# summary of health expenditure data for that country and year. It should:
# - Filter the data for the given country and year
# - Return spending by purpose (both % of CHE and USD)
get_country_spending <- function(country, year) {
  health_exp |>
    filter(____) |>
    ____
}

# Step 2: Define a tool using tool() that wraps your function.
# Give it a description and specify the arguments.
# Look at the tool() documentation if you need help.
country_spending_tool <- tool(
  ___,
  ___,
  ___
)

# Step 3: Create a chat and register the tool.
chat <- chat("anthropic/claude-sonnet-4-6")
___

# Step 4: Try asking the model about spending for a specific country and year
chat$chat("What did Japan spend on preventive care in 2020?")
