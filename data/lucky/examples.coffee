export intro1 = ->
  say paragraph "Welcome, there! You look like a #{if player.has_cunt then "good lay" else "cool guy"}. Wanna fuck?"

  await choice ->
    "Yes": ->
      say paragraph "Yes? Sounds good to me!"
      await scene sex_with_dom
    "No": ->
      say paragraph "No? Nobody says no to me."


sex_with_dom = ->
  switch
    when player.has_cunt
      say paragraph "All right let's fuck!"
      await choice ->
        "Pussy": ->
          say paragraph "What a juicy cunt"
        "Ass": ->
          say paragraph "Eh, it'll do"
    when player.has_cock
      say paragraph "No cunt? Well at least you got an asshole."
    else
      say paragraph "You don't have any holes for me to fuck."


intro2 = ->
  player.name = 'Lucky'

  if not dom.met
    dom.met = true
    say paragraph "Hi I haven't met you before. Your name is #{player.name}? Nice to meet you."
  else
    oneof ->
      1: -> say paragraph "Good to see you again, #{player.name}."
      2: -> say paragraph "How's it going?"
      3: -> say paragraph "What's up?"


intro3 = ->
  say paragraph "This is paragraph one."
  say "Sentence two?"
  say "Wow!"
  say paragraph "This is paragraph two."
  say "fe"
  say "male"
  say paragraph speech "Hello! This is dialogue."


intro4 = ->
  roll20 ->
    1: ->
      say paragraph "You did shit"
    5: ->
      say paragraph "You did bad"
    10: ->
      say paragraph "You did okay"
    15: ->
      say paragraph "You did good"
    20: ->
      say paragraph "You did godly"

intro5 = ->
  say paragraph "That house is #{oneof "red", "blue"}."


intro6 = ->
  say paragraph "You see a vulnerable female husky sleeping."
  
  add player.traits, "Sadist"

  await choice ->
    "Rape is good":
      requirements: -> "Sadist" in player.traits
      outcome: ->
        say paragraph "I win"
        await say sex_with_dom
    "Walk away": ->
      say paragraph "No? Nobody says no to me."

  say paragraph "You made a choice!"