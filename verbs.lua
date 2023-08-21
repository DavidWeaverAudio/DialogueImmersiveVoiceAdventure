local verbs = {
  ["bake"] = "bake",
  ["bathe"] = "bathe",
  ["beat"] = "beat",
  ["beg"] = "beg",
  ["bend"] = "bend",
  ["bite"] = "bite",
  ["blow"] = "blow",
  ["bounce"] = "bounce",
  ["break"] = "break",
  ["build"] = "build",
  ["burn"] = "burn",
  ["buy"] = "buy",
  ["could"] = "could",
  ["catch"] = "catch",
  ["chop"] = "chop",
  ["claim"] = "claim",
  ["climb"] = "climb",
  ["cook"] = "cook",
  ["count"] = "count",
  ["cry"] = "cry",
  ["cut"] = "cut",
  ["dance"] = "dance",
  ["deal"] = "deal",
  ["destroy"] = "destroy",
  ["dive"] = "dive",
  ["do"] = "do",
  ["drag"] = "drag",
  ["drill"] = "drill",
  ["drink"] = "drink",
  ["drive"] = "drive",
  ["drop"] = "drop",
  ["dry"] = "dry",
  ["eat"] = "eat",
  ["enter"] = "enter",
  ["examine"] = "examine",
  ["feed"] = "feed",
  ["feel"] = "feel",
  ["fight"] = "fight",
  ["find"] = "find",
  ["fit"] = "fit",
  ["fly"] = "fly",
  ["fold"] = "fold",
  ["follow"] = "follow",
  ["freeze"] = "freeze",
  ["fry"] = "fry",
  ["gather"] = "gather",
  ["grow"] = "grow",
  ["greet"] = "greet",
  ["give"] = "give",
  ["go"] = "go",
  ["grab"] = "grab",
  ["hang"] = "hang",
  ["hear"] = "hear",
  ["hide"] = "hide",
  ["hit"] = "hit",
  ["hold"] = "hold",
  ["hug"] = "hug",
  ["hurt"] = "hurt",
  ["identify"] = "identify",
  ["investigate"] = "investigate",
  ["jog"] = "jog",
  ["juggle"] = "juggle",
  ["jump"] = "jump",
  ["kick"] = "kick",
  ["kiss"] = "kiss",
  ["kneel"] = "kneel",
  ["know"] = "know",
  ["laugh"] = "laugh",
  ["leave"] = "leave",
  ["lift"] = "lift",
  ["light"] = "light",
  ["listen"] = "listen",
  ["look"] = "look",
  ["love"] = "love",
  ["melt"] = "melt",
  ["mix"] = "mix",
  ["nag"] = "nag",
  ["nudge"] = "nudge",
  ["name"] = "name",
  ["observe"] = "observe",
  ["open"] = "open",
  ["operate"] = "operate",
  ["paint"] = "paint",
  ["pay"] = "pay",
  ["peel"] = "peel",
  ["perform"] = "perform",
  ["persuade"] = "persuade",
  ["pinch"] = "pinch",
  ["play"] = "play",
  ["pour"] = "pour",
  ["pull"] = "pull",
  ["punch"] = "punch",
  ["push"] = "push",
  ["read"] = "read",
  ["repair"] = "repair",
  ["rid"] = "rid",
  ["ride"] = "ride",
  ["roast"] = "roast",
  ["run"] = "run",
  ["scrub"] = "scrub",
  ["see"] = "see",
  ["sell"] = "sell",
  ["send"] = "send",
  ["shake"] = "shake",
  ["shine"] = "shine",
  ["shoot"] = "shoot",
  ["show"] = "show",
  ["shut"] = "shut",
  ["sing"] = "sing",
  ["sink"] = "sink",
  ["sit"] = "sit",
  ["sleep"] = "sleep",
  ["slice"] = "slice",
  ["slide"] = "slide",
  ["slip"] = "slip",
  ["smell"] = "smell",
  ["snore"] = "snore",
  ["speak"] = "speak",
  ["spit"] = "spit",
  ["stack"] = "stack",
  ["stand"] = "stand",
  ["start"] = "start",
  ["steal"] = "steal",
  ["stick"] = "stick",
  ["sting"] = "sting",
  ["stir"] = "stir",
  ["stretch"] = "stretch",
  ["strike"] = "strike",
  ["study"] = "study",
  ["swear"] = "swear",
  ["sweep"] = "sweep",
  ["swim"] = "swim",
  ["swing"] = "swing",
  ["take"] = "take",
  ["talk"] = "talk",
  ["taste"] = "taste",
  ["tear"] = "tear",
  ["threaten"] = "threaten",
  ["throw"] = "throw",
  ["translate"] = "translate",
  ["unfold"] = "unfold",
  ["use"] = "use",
  ["wait"] = "wait",
  ["wake"] = "wake",
  ["walk"] = "walk",
  ["wash"] = "wash",
  ["watch"] = "watch",
  ["whip"] = "whip",
  ["write"] = "write",
  ["yell"] = "yell",
}

local targets = {
  ["sign"] = true,
  ["friend"] = true,
  ["front door"] = true,
  ["book"] = true,
  -- ... add more targets as needed
}

local locations = {
  ["village"] = true,
  ["hill"] = true,
  -- ... add more locations as needed
}

local function extendedTokenize(input)
  local tokens = {}
  for word in input:gmatch("%S+") do
    table.insert(tokens, word)
  end
  return tokens
end

local function analyze(tokens)
  local result = {
    verbs = {},
    targets = {},
    locations = {},
  }

  local i = 1
  while i <= #tokens do
    local token = tokens[i]
    local nextToken = tokens[i + 1]
    local combinedToken = token .. " " .. (nextToken or "")

    if targets[combinedToken] then
      table.insert(result.targets, combinedToken)
      i = i + 2 -- skip the next token since we've combined it
    elseif verbs[token] then
      table.insert(result.verbs, token)
      i = i + 1
    elseif targets[token] then
      table.insert(result.targets, token)
      i = i + 1
    elseif locations[token] then
      table.insert(result.locations, token)
      i = i + 1
    else
      i = i + 1
    end
  end

  return result
end

local function countElementsInConcatenatedString(str)
  local count = 0
  for _ in string.gmatch(str, "[^,]+") do
    count = count + 1
  end
  return count
end

function TokenizeInput(input)
  local tokens = extendedTokenize(input)
  local analysis = analyze(tokens)
  tokenizedInput = {
    verbs = { table.concat(analysis.verbs, ", ") },
    targets = { table.concat(analysis.targets, ", ") },
    locations = { table.concat(analysis.locations, ", ") }
  }
  local numVerbs = countElementsInConcatenatedString(tokenizedInput.verbs[1])
  local numTargets = countElementsInConcatenatedString(tokenizedInput.targets[1])
  local numLocations = countElementsInConcatenatedString(tokenizedInput.locations[1])
  return tokenizedInput, numVerbs, numTargets, numLocations
end
