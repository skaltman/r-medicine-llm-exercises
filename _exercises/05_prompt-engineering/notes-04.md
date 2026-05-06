convos & turns

chat obj keeps history. each $chat() call = new turn. model sees everything prior.
use for multi-turn stuff — follow-ups, clarification, building on prev answer.
new chat() = fresh start, no memory.
tokens add up across turns — long convos get expensive.
can inspect w/ chat$get_turns().

5/5/2026