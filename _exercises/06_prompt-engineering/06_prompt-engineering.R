library(ellmer)
library(readr)
library(purrr)

dir_notes <-
  "~/r-medicine-llm-exercises/_exercises/06_prompt-engineering"
file_prompt <-
  "~/r-medicine-llm-exercises/_exercises/06_prompt-engineering/prompt.md"

notes_files <- list.files(dir_notes, pattern = "^notes-", full.names = TRUE)
notes <- map(notes_files, read_file)

prompt <- read_file(file_prompt)

# Step 1: Send one note file to the model with no system prompt.
chat <- chat("anthropic/claude-haiku-4-5")
chat$chat("Clean up these notes:\n", notes[[1]])

# Step 2: Edit `prompt.md` to define your note format spec.
# Then run the same note through with your system prompt.
chat2 <- chat(
  "anthropic/claude-haiku-4-5",
  system_prompt = prompt
)
chat2$chat("Clean up these notes:\n", notes[[1]])

# Step 3: Run all notes through with your system prompt.
# Do they all come out in the same format?
walk(notes, \(note) {
  chat3 <- chat(
    "anthropic/claude-haiku-4-5",
    system_prompt = prompt
  )
  chat3$chat("Clean up these notes:\n", note)
})
