library(ellmer)

# Step 1: List available models for OpenAI and Anthropic
# List models using the `models_*()` functions.
models_____
models_____

# Feel free to change the prompt!
prompt <- "Write some code to generate a synthetic dataset in R."

# Step 2: Compare responses from different models
# Try sending the same prompt to different models to compare the responses.
chat1 <- chat("openai/____")
chat1$chat(prompt)

chat2 <- chat("anthropic/____")
chat2$chat(prompt)
