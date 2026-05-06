library(ellmer)

# There are several data visualization plots in this folder.
# Your job: ask the LLM to interpret them.

# Step 1: Pick a plot and ask the model to describe what it shows.
chat <- chat("anthropic/claude-haiku-4-5")
chat$chat(
  "Describe what this plot shows.",
  content_image_file(
    here::here("_exercises/04_vision/health-expenditure-preventive.png")
  )
)

# Step 2: Try a different plot. Ask a more specific question about it.
chat2 <- chat("anthropic/claude-haiku-4-5")
chat2$chat(
  "What trends do you notice in this visualization?",
  content_image_file(
    here::here("_exercises/04_vision/health-expenditure-curative-comparison.png")
  )
)

# Step 3: Try other plots in this folder and experiment with different prompts!
# Available plots:
#   - health-expenditure-preventive.png
#   - health-expenditure-japan.png
#   - health-expenditure-curative-comparison.png
#   - georgia-mortality-by-site.png
