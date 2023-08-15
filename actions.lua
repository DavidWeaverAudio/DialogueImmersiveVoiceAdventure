local player = require("player")
local rooms = require("rooms")

local function rollD20()
  return math.random(1, 20)
end

local actions = {
  go = function(direction)
    local newRoom = rooms[player.currentRoom].exits[direction]
    if newRoom then
      player.currentRoom = newRoom
    else
      print("You can't go that way!")
    end
  end,
  inspect = function(item)
    if rooms[player.currentRoom].items and rooms[player.currentRoom].items[item] then
      print(rooms[player.currentRoom].items[item].description)
    else
      print("You don't see that here.")
    end
  end,
  take = function(item)
    if rooms[player.currentRoom].items and rooms[player.currentRoom].items[item] then
      table.insert(player.inventory, item)
      print("You took the " .. item .. ".")
      rooms[player.currentRoom].items[item] = nil
    else
      print("You can't take that.")
    end
  end,

  inventory = function()
    if #player.inventory == 0 then
      print("You have no items.")
    else
      print("You have:")
      for _, item in ipairs(player.inventory) do
        print(item)
      end
    end
  end,
  investigate = function()
    local roll = rollD20()
    print("You rolled a " .. roll .. ".")
    if roll > 10 and rooms[player.currentRoom].hiddenExits then
      for direction, room in pairs(rooms[player.currentRoom].hiddenExits) do
        print("You've discovered a hidden exit to the " .. direction .. "!")
        rooms[player.currentRoom].exits[direction] = room

        -- Append details about the entry point to the room's description
        rooms[player.currentRoom].description = rooms[player.currentRoom].description ..
            "\nYou notice a concealed entrance leading " .. direction .. "."
      end
      rooms[player.currentRoom].hiddenExits = nil -- Remove hidden exits after they're discovered
    else
      print("You didn't find anything unusual.")
    end
  end
}

return actions
