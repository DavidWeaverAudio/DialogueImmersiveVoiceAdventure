local rooms = require("rooms")
local actions = require("actions")
local player = require("player")

while true do
  DisplayRoomDescription(player)
  print("\nWhat do you want to do?")
local input = io.read()
local action, argument = input:match("^(%w+)%s*(.*)$")

if actions[action] then
    actions[action](argument)
else
    print("I don't understand that command.")
end
end