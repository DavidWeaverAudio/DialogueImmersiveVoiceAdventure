local rooms = {
  introduction = {
    description = "You find yourself in the village of Barovia...",
    exits = { north = "houseEntrance" },

    items = {
      sign = {
        description = "The sign reads: 'Welcome to Barovia.'"
      }
    }
  },
  houseEntrance = {
    description = "You stand before the Durst Mansion...",
    exits = { south = "introduction", north = "livingRoom" },
    -- ... items
  },
  livingRoom = {
    description = "You're in a spooky house. What more can I say?",
    exits = { north = "houseEntrance" },
    items = {
      doll = {
        description = "A small pink doll"
      }
    }
  }
  -- ... rooms
}

-- player
local player = {
  currentRoom = "introduction",
  inventory = {},
}

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
  end
}

local function getRoomDescription(room)
  local description = room.description
  if room.items then
    for item, details in pairs(room.items) do
      description = description .. "\nYou see a " .. item .. " here."
    end
  end
  return description
end

-- Game loop
while true do
  print(getRoomDescription(rooms[player.currentRoom]))
  print("\nWhat do you want to do?")
  local input = io.read()
  local action, argument = input:match("^(%w+)%s*(%w*)$")

  if actions[action] then
    actions[action](argument)
  else
    print("I don't understand that command.")
  end
end
