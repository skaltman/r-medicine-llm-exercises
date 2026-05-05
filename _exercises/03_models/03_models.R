library(ellmer)

# Step 1: List available models for OpenAI and Anthropic
# List models using the `models_*()` functions.
# Hint: try using the Positron data viewer by calling `View()` on the results.
models_____
models_____

prompt <- "Write some code to generate a synthetic dataset in R."

# Step 2: Compare responses from different models
# Try sending the same prompt to different models to compare the responses.
chat("openai/____")$chat(prompt)
chat("anthropic/____")$chat(prompt)


# Bonus: Repeat your OpenAI and Anthropic requests using direct provider
# functions.
chat_____(____)$chat(prompt)
