local objects = {
  thing = {
    description = "It's a thing!",
    shortDescription = "Thing",
    usagePhrases = {
      ["read"] = "houseEntrance",
      ["throw"] = "houseEntrance",
    },
    investigationDC = 18,
  },
  sign = {
    description = "A small wooden sign with the words 'Village of Barovia' on it.",
    shortDescription = "Wooden Sign",
    usagePhrases = {
      ["read"] = "hmm words",
      ["throw"] = "bye bye",
      ["go"] = "inside"
    },
    investigationDC = 18,
  }
}
return objects
