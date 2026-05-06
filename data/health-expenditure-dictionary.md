# Data Dictionary: health-expenditure.csv

Source: WHO Global Health Expenditure Database (GHED). Data available from 2016 onwards.

| Variable | Type | Description |
|---|---|---|
| `country_name` | character | Country or territory name as used by WHO. |
| `iso3_code` | character | ISO 3166-1 alpha-3 country code. |
| `year` | integer | Year of observation. |
| `spending_purpose` | character | Health care function or purpose of spending. One of: Curative care, Rehabilitative care, Long-term care (health), Ancillary services (non-specified by function), Medical goods (non-specified by function), Preventive care, Governance and health system and financing administration, or Other health care services not elsewhere classified (n.e.c.). |
| `pct_current_health_exp` | double | Spending on this purpose as a percentage of current health expenditure (CHE). |
| `usd_2023` | double | Spending on this purpose in constant 2023 US dollars. |

## Notes

This file was derived from the raw GHED data by pivoting the unit of measurement into separate columns (`pct_current_health_exp` and `usd_2023`). The original `indicator_code` and `unit` columns were dropped as they are now redundant.

### Spending purpose GHED indicator codes

| Code | Spending purpose |
|---|---|
| hc1 | Curative care |
| hc2 | Rehabilitative care |
| hc3 | Long-term care (health) |
| hc4 | Ancillary services |
| hc5 | Medical goods |
| hc6 | Preventive care |
| hc7 | Governance and health system administration |
| hc9 | Other health care services (n.e.c.) |
