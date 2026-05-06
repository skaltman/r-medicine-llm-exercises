system prompts

- tell the model who it is
- goes at the beginning before user messages
- can set tone, format, constraints
- in ellmer you pass system_prompt arg to chat()
- good for: consistent formatting, persona, limiting scope
- don't put instructions that change per-request in the system prompt
- also tried making it refuse to answer non-R questions
- system prompt is NOT visible to the user in most UIs
- token usage: system prompt counts toward context window
- can be long or short, depends on use case

2026-05-06