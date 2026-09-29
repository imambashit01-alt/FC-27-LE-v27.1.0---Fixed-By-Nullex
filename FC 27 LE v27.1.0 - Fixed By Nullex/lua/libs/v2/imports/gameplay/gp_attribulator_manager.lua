local GameplayAttribulatorManager = {}

function GameplayAttribulatorManager:new()
    local o = setmetatable({}, self)

    -- lua metatable
    self.__index = self
    self.__name = "GameplayAttribulatorManager"

    return o
end

-- Export gameplayattribdb to json file
-- By default to "C:\FC 25 Live Editor\gameplayattribdb.json"
-- Valid attribdb names:
-- gameplayattribdb
-- prematchattribdb
-- perksattribdb
-- simulation
-- penta
function GameplayAttribulatorManager:SaveToFile(file_path, db_name)
    GameplayAttribulatorSaveToFile(file_path or "", db_name or "gameplayattribdb")
end

-- Set Variable. Auto detect type by value (slower than other setters)
function GameplayAttribulatorManager:SetVar(path, value)
    return GameplayAttribulatorSetVar(path, value)
end

-- Set Float value by item path
function GameplayAttribulatorManager:SetFloatValue(path, value)
    GameplayAttribulatorSetFloat(path, value)
end

-- Set Int value by item path
function GameplayAttribulatorManager:SetIntValue(path, value)
    GameplayAttribulatorSetInt(path, value)
end

-- Set Bool value by item path
function GameplayAttribulatorManager:SetBoolValue(path, value)
    local v = 0
    if (value) then 
        v = 1 
    end

    GameplayAttribulatorSetBool(path, v)
end

-- Get Variable Type by item path
function GameplayAttribulatorManager:GetVarType(path)
    return GameplayAttribulatorGetVarType(path)
end

-- Get Float value by item path
function GameplayAttribulatorManager:GetFloatValue(path)
    return GameplayAttribulatorGetFloat(path)
end

-- Get Int value by item path
function GameplayAttribulatorManager:GetIntValue(path)
    return GameplayAttribulatorGetInt(path)
end

-- Get Bool value by item path
function GameplayAttribulatorManager:GetBoolValue(path)
    return GameplayAttribulatorGetBool(path)
end

return GameplayAttribulatorManager;
