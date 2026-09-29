local GameLocalizationManager = {}

function GameLocalizationManager:new()
    local o = setmetatable({}, self)

    -- lua metatable
    self.__index = self
    self.__name = "GameLocalizationManager"

    return o
end

function GameLocalizationManager:SetString(key, value)
    SetGameLocString(key, value)
end

function GameLocalizationManager:GetString(key)
    return GetGameLocString(key)
end

return GameLocalizationManager;