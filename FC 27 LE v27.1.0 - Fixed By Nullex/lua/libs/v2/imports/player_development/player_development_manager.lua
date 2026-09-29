local PlayerDevelopmentManager = {}

function PlayerDevelopmentManager:new()
    local o = setmetatable({}, self)

    -- lua metatable
    self.__index = self
    self.__name = "PlayerDevelopmentManager"

    return o
end

-- Load From C:\FC 25 Live Editor\extensions\careers\<SAVE_ID>\players_development.json
function PlayerDevelopmentManager:Load()
    PlayerDevelopmentManagerLoad()
end

-- Save to C:\FC 25 Live Editor\extensions\careers\<SAVE_ID>\players_development.json
function PlayerDevelopmentManager:Save()
    PlayerDevelopmentManagerSave()
end

-- Add custom development speed for player
function PlayerDevelopmentManager:AddPlayer(playerid, xp_multiplier, bonus_xp, no_decline)
    PlayerDevelopmentManagerAddPlayer(playerid, xp_multiplier, bonus_xp, no_decline)
end

-- Remove player custom developmen
function PlayerDevelopmentManager:RemovePlayer(playerid)
    PlayerDevelopmentManagerRemovePlayer(playerid)
end

return PlayerDevelopmentManager;
