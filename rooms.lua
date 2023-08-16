local rooms = {
  introduction = {
    description = "You find yourself in the village of Barovia. There's a spooky house on the hill (aa)",
    shortDescription = "Village of Barovia",
    directions = "\nHouse On the Hill : aa",
    exits = { 
      aa = "houseEntrance",
    },
    hiddenExits = { 
      secret = "secretRoom",
    },
    investigationDC = 18,
    items = {
      sign = {
        description = "The sign reads: 'Welcome to Barovia.'",
      },
    },
  },

  houseEntrance = {
    description = "The gate is unlocked and it's rusty hinges shriek when the gate is opened. Oil lamps hang from the portico ceiling by chains, flanking a set of oaken doors that open into a grand FOYER (a0). Back the way you came is the VILLAGE (aa)",
    shortDescription = "The entrance to the house.",
    directions = "\nBack the way you came : aa\nThe grand Foyer : a0",
    exits = { 
      aa = "introduction", 
      a0 = "grandFoyer" ,
    },
  },

  grandFoyer = {
    description = "Hanging on the south wall of the foyer is a shield emblazoned with the coat-of-arms (a stylized golden windmill on a red field), flanked by framed portraits of stony-faced aristocrats (long-dead members of the Durst Family). Mahogany framed double doors leading from the foyer to the MAIN HALL (a2) are set with panes of stained glass. Behind your, doors lead OUTSIDE (a1)",
    shortDescription = "Grand Foyer",
    directions = "\n Doors to Outside : a1\nMain Hall : a2",
    exits = { 
      a1 = "houseEntrance", 
      a2 = "mainHall" 
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
    exits = { 
      a2 = 'grandFoyer', 
      a3 = 'denOfWolves' 
    },
  },
  denOfWolves = {
    description = "This oak-paneled room looks like a hunter's den. Mounted above the fireplace is a stag's head, and positioned around the outskirts of the room are three stuffed wolves. Two padded chairs draped in animal furs face the hearth, with an oak table between them supporting a cask of wine, two carved wooden goblets, a pipe rack, and a candelabrum. A chandelier hangs above a cloth-covered table surrounded by four chairs. Two cabinets tand against the walls. The east cabinet sports a lock that can be picked with thieves' tools and a successful DC 15 dexterity check. It holds a heavy crossbow, a light crossbow, a hand crossbow, and 20 bolts for each weapon. The north cabinet is unlocked and holds a small box containing a deck of playing cards and an assortment of wine glasses. A trapdoor is hidden in the southwest corner of the floor. it can't be detected or opened until the characters approach it from the underside. Until then, the death house supernaturally hides the trapdoor.",
    shortDescription = 'Den of Wolves',
    directions = "\n Main Hall : a3",
    exits = { a3 = 'mainHall' },
  }
}

return rooms
