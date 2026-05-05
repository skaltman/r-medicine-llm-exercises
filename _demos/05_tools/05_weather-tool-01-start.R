# ---- ✦ I can get the weather with R! ✦ ----
library(weathR)

posit_conf <- list(lat = 33.761627, lon = -84.386963)

weathR::point_forecast(posit_conf$lat, posit_conf$lon)


# ---- ⚒️ Let's turn this into a tool 🛠️ ----
library(ellmer)

ellmer::create_tool_def(weathR::point_forecast, verbose = TRUE)

get_weather <- tool()

# The tool is callable!
get_weather(posit_conf$lat, posit_conf$lon)

# ---- 🧰 Teach an LLM that we have this tool ----
chat <- chat_openai(model = "gpt-4.1-nano")

# Register the tool with the chatbot

chat$chat("What should I wear to R/Medicine 2026?")
