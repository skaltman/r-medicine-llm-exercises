library(ellmer)

source(here::here("data/clinical-notes.R"))

# Look at the first note
clinical_notes[[1]]

#' Extract structured data from each clinical note.
#'
#' Here's an example of what the structured output should look like:
#'
#' {
#'   "name": "Maria Chen",
#'   "age": 58,
#'   "sex": "Female",
#'   "diagnoses": ["Type 2 diabetes mellitus", "Hypertension"],
#'   "medications": [
#'     {
#'       "name": "Metformin",
#'       "dose": "500mg",
#'       "frequency": "twice daily"
#'     },
#'     {
#'       "name": "Lisinopril",
#'       "dose": "10mg",
#'       "frequency": "once daily"
#'     }
#'   ]
#' }
#'
#' Hint: You can use `required = FALSE` in `type_*()` functions to indicate that
#' a field is optional.

type_patient <- type_____(
  name = ____(),
  age = ____(),
  sex = ____(),
  diagnoses = type_array(____()),
  medications = type_array(
    type_object(
      name = ____(),
      dose = ____(),
      frequency = ____()
    )
  )
)

chat <- chat("anthropic/claude-haiku-4-5")

# Test with one or two notes
chat$chat_structured(clinical_notes[[1]], type = type_patient)

# Then use parallel_chat_structured() to run all notes
# Look at documentation (?parallel_chat_structured) to see how it works
notes_df <-
  parallel_chat_structured(
    chat("anthropic/claude-haiku-4-5"),
    prompts = ____,
    type = ____
  )
