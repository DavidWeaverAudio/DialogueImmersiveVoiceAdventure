local rooms = require("rooms")
local actions = require("actions")
local player = require("player")

local function getRoomDescription(room)
  local description = room.description
  if room.items then
    for item, details in pairs(room.items) do
      description = description .. "\nYou see a " .. item .. " here."
    end
  end
  return description
end

while true do
  if player.visitedRooms[player.currentRoom] then
    print(rooms[player.currentRoom].shortDescription)
  else
    print(getRoomDescription(rooms[player.currentRoom]))
    player.visitedRooms[player.currentRoom] = true

  end

  print("\nWhat do you want to do?")
  local input = io.read()
  local action, argument = input:match("^(%w+)%s*(%w*)$")

  if actions[action] then
    actions[action](argument)
  else
    print("I don't understand that command.")
  end
end
