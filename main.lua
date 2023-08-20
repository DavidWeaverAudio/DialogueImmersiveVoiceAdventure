local rooms = require("rooms")
local actions = require("actions")
local player = require("player")
local npcs = require("npc")

function callPythonNLP(input)
  local command = "python nlp_process.py " .. '"' .. input .. '"'
  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()
  return result
end

local playerInput = "I want to convince the barkeep to sleep with me"
local command = callPythonNLP(playerInput)
print(command)


while true do
  DisplayRoomDescription(player)
  print("\nWhat do you want to do?")
  local input = io.read()

  local action, firstArg, secondArg = input:match("^(%w+)%s*(%w*)%s*(.*)$")

  if actions[action] then
    if action == "useSkill" then
      actions[action](firstArg, secondArg)
    else
      actions[action](firstArg)
    end
  else
    print("I don't understand that command.")
  end
  print(actions[action])
  PerformAction(actions[action])
  for _, npc in pairs(npcs) do
    print(GetNPCReaction(npc))
  end
end
--[[
    local action, argument = input:match("^(%w+)%s*(.*)$")

  if actions[action] then
    actions[action](argument)
  else
    print("I don't understand that command.")
  end
end
  ]] --
