library(tidyverse)

health_exp <- read_csv(
  here::here("data/health-expenditure.csv"),
  show_col_types = FALSE
)

mortality <- read_csv(
  here::here("data/georgia_mortality.csv"),
  show_col_types = FALSE
)

# Plot 1: Top 10 countries by preventive care spending in 2020
p1 <- health_exp |>
  filter(spending_purpose == "Preventive care", year == 2020) |>
  slice_max(usd_2023, n = 10) |>
  mutate(
    country_name = str_replace(
      country_name,
      " of Great Britain and",
      "\nof Great Britain and"
    ),
    country_name = fct_reorder(country_name, usd_2023)
  ) |>
  ggplot(aes(x = usd_2023 / 1e9, y = country_name)) +
  geom_col() +
  labs(
    title = "Top 10 Countries by Preventive Care Spending (2020)",
    x = "Spending (Billion USD, 2023 constant)",
    y = NULL
  )

ggsave(
  "health-expenditure-preventive.png",
  p1,
  width = 8,
  height = 5,
  dpi = 150
)

# Plot 2: Spending breakdown by purpose for Japan over time
p2 <- health_exp |>
  filter(country_name == "Japan") |>
  mutate(spending_purpose = str_remove(spending_purpose, " \\(.*\\)")) |>
  ggplot(aes(x = year, y = pct_current_health_exp, fill = spending_purpose)) +
  geom_area() +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Japan: Health Spending by Purpose (% of Current Health Expenditure)",
    x = "Year",
    y = "% of Current Health Expenditure",
    fill = "Purpose"
  )

ggsave("health-expenditure-japan.png", p2, width = 9, height = 6, dpi = 150)

# Plot 3: Georgia mortality by cancer site (top sites, 2021)
p3 <- mortality |>
  filter(Year == 2021) |>
  group_by(Site) |>
  summarize(deaths = sum(n), .groups = "drop") |>
  filter(Site != "Other Site") |>
  slice_max(deaths, n = 8) |>
  mutate(Site = fct_reorder(Site, deaths)) |>
  ggplot(aes(x = deaths, y = Site)) +
  geom_col() +
  labs(
    title = "Georgia Cancer Deaths by Site (2021)",
    x = "Total Deaths",
    y = NULL
  )

ggsave("georgia-mortality-by-site.png", p3, width = 8, height = 5, dpi = 150)

# Plot 4: Curative care spending over time for select countries
p4 <- health_exp |>
  filter(
    spending_purpose == "Curative care",
    country_name %in%
      c("United States of America", "Japan", "Germany", "Brazil")
  ) |>
  mutate(
    country_name = str_replace(country_name, "United States of America", "USA")
  ) |>
  ggplot(aes(x = year, y = usd_2023 / 1e9, color = country_name)) +
  geom_line() +
  geom_point() +
  scale_y_log10() +
  labs(
    title = "Curative Care Spending Over Time",
    x = "Year",
    y = "Spending (Billion USD, 2023 constant)",
    color = NULL
  ) +
  theme(legend.position = "bottom")

ggsave(
  "health-expenditure-curative-comparison.png",
  p4,
  width = 8,
  height = 5,
  dpi = 150
)
