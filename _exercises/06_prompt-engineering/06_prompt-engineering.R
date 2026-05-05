library(ellmer)

# Step 1: Ask the model to interpret this plot with no special prompting.
chat <- chat("anthropic/claude-sonnet-4-6")
chat$chat(
  "Interpret this plot.",
  content_image_file(
    here::here("_exercises/06_prompt-engineering/georgia-mortality-plot.png")
  )
)

# Step 2: Edit `prompt.md` to write a system prompt that tailors the
# interpretation for a specific audience, then run this code.
chat2 <- chat(
  "anthropic/claude-sonnet-4-6",
  system_prompt = readr::read_file(
    here::here("_exercises/06_prompt-engineering/prompt.md")
  )
)
chat2$chat(
  "Interpret this plot.",
  content_image_file(
    here::here("_exercises/06_prompt-engineering/georgia-mortality-plot.png")
  )
)
