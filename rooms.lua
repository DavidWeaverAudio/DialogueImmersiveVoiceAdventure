function getRoomDescription(room)
  local description = room.description
  if room.items then
    for item, details in pairs(room.items) do
      description = description .. "\nYou see a " .. item .. " here."
    end
  end
  return description
end

local rooms = {
  introduction = {
    description = "You find yourself in the village of Barovia. There's a spooky house on the hill",
    shortDescription = "Village of Barovia",
    directions = "\nHouse On the Hill",
    directionPhrases = {
      ["to the entrance"] = "houseEntrance",
      ["through the gate"] = "houseEntrance",
      ["to the door"] = "houseEntrance",
      ["to the house"] = "houseEntrance",
      ["to the spooky house"] = "houseEntrance",
      ["inside"] = "houseEntrance"
    },
    exits = {
      houseEntrance = "houseEntrance",
    },
    hiddenExits = {
      secret = "secretRoom",
    },
    investigationDC = 18,
    items = {
      sign = {
        description = "The sign reads: 'Welcome to Barovia.'",
      },
      cow = {
        description = "A calm-looking cow grazes here.",
        interactions = {}
      },
    },
  },

  houseEntrance = {
    description = "The gate is unlocked and it's rusty hinges shriek when the gate is opened. Oil lamps hang from the portico ceiling by chains, flanking a set of oaken doors that open into a Grand Foyer.",
    shortDescription = "The entrance to the house.",
    directions = "\nThe grand Foyer\nOutside the House",
    directionPhrases = {
      ["through the gate"] = "grandFoyer",
      ["through the doors"] = "grandFoyer",
      ["through the front door"] = "grandFoyer",
      ["inside"] = "grandFoyer",
      ["to open the doors"] = "grandFoyer",
    },
    exits = {
      introduction = "introduction",
      grandFoyer = "grandFoyer",
    },
  },

  grandFoyer = {
    description = "Hanging on the south wall of the foyer is a shield emblazoned with the coat-of-arms (a stylized golden windmill on a red field), flanked by framed portraits of stony-faced aristocrats (long-dead members of the Durst Family). Mahogany framed double doors leading from the foyer to the Main Hall are set with panes of stained glass. Behind your, doors lead Outside",
    shortDescription = "Grand Foyer",
    directions = "\nDoors to Outside\nMain Hall",
    directionPhrases = {
      ["to the main hall"] = "mainHall",
      ["main hall"] = "mainHall",
      ["to main hall"] = "mainHall",
      ["through doors"] = "mainHall",
      ["into doors"] = "mainHall",
      ["into main hall"] = "mainHall",
      ["outside"] = "houseEntrance",
      ["to the lobby"] = "houseEntrance",
    },
    exits = {
      houseEntrance = "houseEntrance",
      mainHall = "mainHall"
    },
    items = {
      doll = {
        description = "A small pink doll"
      },
    },
  },
  secretRoom = {
    description = "You've discovered a secret room...",
    exits = {
      west = "houseEntrance"
    },
  },
  mainHall = {
    description = "A wide hall (area 2A) runs the width of the house, with a black marble fireplace at one end and a sweeping red marble staircase at the other. Mounted on the wall above the fireplace is a longsword (nonmagical) with a windmill camero worked into the hilt. The wood-panelled walls are ornately sculpted with images of vines, flowers, nymps, and satyrs. Characters who search the walls for secret doors or otherwise inspect the paneling can, with a successful DC12 wisdom (perception) check, see serpents and skulls inconscipuously woven into the wall designs. The decorative paneling follows a staircase as it circles upward to the second floor. A cloakroom, (area 2D) has several black cloaks hanging from hooks on the walls. A top hat sits on a high shelf.",
    shortDescription = "Main Hall",
    directions = "\n Grand Foyer : a2\nDen Of Wolves : a3",
    directionPhrases = {
      ["to the den of wolves"] = "denOfWolves",
      ["to the oak panelled room"] = "denOfWolves",
      ["to the oak doors"] = "denOfWolves",
      ["into the oak room"] = "denOfWolves",
      ["into the room"] = "denOfWolves",

      ["to the grand foyer"] = "grandFoyer",
      ["to the foyer"] = "grandFoyer",
    },
    exits = {
      grandFoyer = 'grandFoyer',
      denOfWolves = 'denOfWolves'
    },
  },
  denOfWolves = {
    description = "This oak-paneled room looks like a hunter's den. Mounted above the fireplace is a stag's head, and positioned around the outskirts of the room are three stuffed wolves. Two padded chairs draped in animal furs face the hearth, with an oak table between them supporting a cask of wine, two carved wooden goblets, a pipe rack, and a candelabrum. A chandelier hangs above a cloth-covered table surrounded by four chairs. Two cabinets tand against the walls. The east cabinet sports a lock that can be picked with thieves' tools and a successful DC 15 dexterity check. It holds a heavy crossbow, a light crossbow, a hand crossbow, and 20 bolts for each weapon. The north cabinet is unlocked and holds a small box containing a deck of playing cards and an assortment of wine glasses. A trapdoor is hidden in the southwest corner of the floor. it can't be detected or opened until the characters approach it from the underside. Until then, the death house supernaturally hides the trapdoor.",
    shortDescription = 'Den of Wolves',
    directions = "\n Main Hall : a3",
    directionPhrases = {
      ["to the main hall"] = "mainHall",
      ["out of the room"] = "mainHall",
      ["into the hall"] = "mainhall",
    },
    exits = { a3 = 'mainHall' },
  }
}

function GetRooms()
  return rooms
end

function DisplayRoomDescription(player)
  if player.visitedRooms[player.currentRoom] then
    print(rooms[player.currentRoom].shortDescription)
  else
    print(getRoomDescription(rooms[player.currentRoom]))
    player.visitedRooms[player.currentRoom] = true
  end
end

function GetFullRoomDescription(player)
  print(getRoomDescription(rooms[player.currentRoom]))
end

function GetAllRoomExits(player)
  for index, value in pairs(rooms[player.currentRoom].directionPhrases) do
    print("*" .. index)
  end
end
