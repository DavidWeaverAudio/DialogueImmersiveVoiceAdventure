local rooms = {
  introduction = {
    description = "You find yourself in the village of Barovia...",
    exits = { north = "houseEntrance" },
    hiddenExits = { secret = "secretRoom" },
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
  },
  secretRoom = {
    description = "You've discovered a secret room...",
    exits = { west = "houseEntrance" },
    -- ... add more items
  },
  -- ... rooms
}

return rooms
