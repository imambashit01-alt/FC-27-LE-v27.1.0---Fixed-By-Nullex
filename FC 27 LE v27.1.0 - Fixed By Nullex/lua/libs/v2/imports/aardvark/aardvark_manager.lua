local AardvarkManager = {}

function AardvarkManager:new()
    local o = setmetatable({}, self)

    -- lua metatable
    self.__index = self
    self.__name = "AardvarkManager"

    return o
end

-- Export Aardvark Database to csv file
-- By default to "C:\FC 25 Live Editor\aardvark_db.csv"
function AardvarkManager:ExportToFile(file_path)
    AardvarkExport(file_path or "")
end

function AardvarkManager:SetInt(key, value)
    AardvarkSetInt(key, value)
end

function AardvarkManager:SetFloat(key, value)
    AardvarkSetFloat(key, value)
end

function AardvarkManager:SetString(key, value)
    AardvarkSetString(key, value)
end

function AardvarkManager:GetInt(key, defval)
    return AardvarkGetInt(key, defval or 0)
end

function AardvarkManager:GetFloat(key, defval)
    return AardvarkGetFloat(key, defval or 0.0)
end

function AardvarkManager:GetString(key, defval)
    return AardvarkGetString(key, defval or "")
end

return AardvarkManager;