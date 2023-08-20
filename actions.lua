local player = require("player")
local rooms = require("rooms")

local function rollD20()
  return math.random(1, 20)
end

local easyRoll = 5
local mediumRoll = 10
local hardRoll = 15

local rooms = GetRooms()

local actions = {
  help = function(direction)
    print("You can;\ntake\ninspect\ninventory\ngo\ninvestigate")
  end,

  dir = function()
    print(rooms[player.currentRoom].directions)
  end,

  where = function()
    GetFullRoomDescription(player)
  end,

  go = function(destination)
    if destination == "back" then
      if #player.roomHistory > 0 then
        player.currentRoom = table.remove(player.roomHistory)
        return
      else
        print("You can't go back from here!")
        return
      end
    end
    local currentRoom = rooms[player.currentRoom]
    local actualDirection = currentRoom.directionPhrases[destination] or destination
    local newRoom = currentRoom.exits[actualDirection]
    if newRoom then
      table.insert(player.roomHistory, player.currentRoom)
      player.currentRoom = newRoom
    else
      --print(string.format("you tried to go '%s'",actualDirection))
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
    local currentRoom = rooms[player.currentRoom]
    if currentRoom.investigationDC and roll >= currentRoom.investigationDC then
      if currentRoom.hiddenExits then
        for direction, room in pairs(currentRoom.hiddenExits) do
          print("You've discovered a hidden exit to the " .. direction .. "!")
          currentRoom.exits[direction] = room

          currentRoom.description = currentRoom.description ..
              "\nYou notice a concealed entrance leading " .. direction .. "."
        end
        currentRoom.hiddenExits = nil
      end
    else
      print("You didn't find anything unusual.")
    end
  end,
  
useSkill = function(skill, target)
        local currentRoom = rooms[player.currentRoom]
        local item = currentRoom.items and currentRoom.items[target]
        if item and item.interactions and item.interactions[skill] then
            local roll = rollD20() + player.skills[skill]
            if roll >= 10 then
                if type(item.interactions[skill].success) == "function" then
                    item.interactions[skill].success()
                else
                    print(item.interactions[skill].success)
                end
            else
                print(item.interactions[skill].fail)
            end
        else
            print("You can't use that skill here.")
        end
    end,

}
return actions
