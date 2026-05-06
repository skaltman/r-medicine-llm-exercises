may 4, 2026

tool calling

```r
get_weather <- function(city) {
  # calls weather API
  weathR::get_forecast(city)
}

weather_tool <- tool(
  get_weather,
  "Get the current weather forecast for a city",
  city = type_string("The city name")
)

chat <- chat("anthropic/claude-sonnet-4-6")
chat$register_tool(weather_tool)
chat$chat("What's the weather in Austin?")
```

tool() wraps a function
register_tool() adds it to the chat
model decides when to call it
can have multiple tools registered
