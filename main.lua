local rooms = require("rooms")
local actions = require("actions")
local player = require("player")
local npcs = require("npc")
local verbs = require("verbs")

while true do
  DisplayRoomDescription(player)
  print("\nWhat do you want to do?")
  local debug = true
  local input = io.read()

  local tokenizedInput, verbCount, targetCount, locationCount = TokenizeInput(input)

  local verb, target, location

  if (verbCount > 1) then
    --What would you like to "do", youve written too many things
  else
    verb = tokenizedInput["verbs"][1]
  end

  if (targetCount > 1) then
    --What would you like to "take", youve written too many things
  else
    target = tokenizedInput["targets"][1]
  end

  if (locationCount > 1) then
    --Where would you like to do the thing, youve written too many places
  else
    location = tokenizedInput["locations"][1]
  end

  --Pass tokenized input to bank.
  if debug then
    print(verbCount, targetCount, locationCount)
    print(verb, target, location)
  end
end
