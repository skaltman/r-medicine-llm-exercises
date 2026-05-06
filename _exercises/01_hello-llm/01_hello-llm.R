# https://ellmer.tidyverse.org/
library(ellmer)

# ---- OpenAI ----
chat_gpt <- chat_openai()
chat_gpt$chat(
  "I'm at the R/Medicine 2026 conference.",
  "Write an R-related joke."
)

# ---- Anthropic ----
chat_claude <- chat_anthropic()
chat_claude$chat(
  "I'm at the R/Medicine 2026 conference.",
  "Write an R-related limerick.."
)
