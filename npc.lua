local npcs = {
    john = {
        name = "John",
        mood = 0,  -- Neutral mood
        reactions = {
            happy = "John seems pleased.",
            neutral = "John doesn't seem to have a strong reaction.",
            unhappy = "John seems displeased."
        }
    },
    -- ... other NPCs ...
}

local actionImpact = {
    investigate = {
        john = 2,  -- Investigating increases John's mood by 2
        -- ... impact on other NPCs ...
    },
    where  = {
        john = -5,  -- Finding out where you are decreases John's mood by 5
        -- ... impact on other NPCs ...
    },
    -- ... other actions ...
}

function PerformAction(action)
    local impact = actionImpact[action]
    if impact then
        for npcName, moodChange in pairs(impact) do
            local npc = npcs[npcName]
            npc.mood = npc.mood + moodChange
        end
    end
end

function GetNPCReaction(npc)
    if npc.mood > 5 then
        return npc.reactions.happy
    elseif npc.mood < -5 then
        return npc.reactions.unhappy
    else
        return npc.reactions.neutral
    end
end
