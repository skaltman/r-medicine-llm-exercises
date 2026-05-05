library(ellmer)


# 1. Fill in the blanks below to create a `chat` a system prompt
# instructing the model to answer briefly.
chat <- chat(
  name = "anthropic/claude-opus-4-7",
  ____ = "Answer in as few words as possible."
)

# 2. Fill in the blank to ask the the first question:
____("What ellmer function tells me what Anthropic models are available?")

# 3. Fill in the blank to ask the the second question:
_____("What about OpenAI models?")

# 4. Create a new chat with no system prompt and ask the second question again.
chat2 <- chat(name = "anthropic/claude-opus-4-7")
chat2$____("What about OpenAI models?")

# 5. How do the answers to 3 and 4 differ? Why?
