require 'imports/core/consts' 
require 'imports/career_mode/helpers'

local FCECareerModeUserManager = {}

function FCECareerModeUserManager:new()
    local o = setmetatable({}, self)

    -- lua metatable
    self.__index = self
    self.__name = "FCE::CareerMode::UserManager"

    self.user_manager_offsets = {
        mUserType = 0x37,
        mPlayerId = 0x3C
    }

    return o
end

function FCECareerModeUserManager:GetAddr()
    return GetManagerObjByTypeId(ENUM_FCEGameModesFCECareerModeUserManager)
end

-- Return true if in Manager Career Mode
function FCECareerModeUserManager:IsManagerCareer() 
    local user_mgr = self:GetAddr()
    if (user_mgr == 0) then return false end

    return MEMORY:ReadInt(user_mgr + self.user_manager_offsets.mUserType) == 0
end

-- Return true if in Player Career Mode
function FCECareerModeUserManager:IsPlayerCareer() 
    local user_mgr = self:GetAddr()
    if (user_mgr == 0) then return false end

    return MEMORY:ReadInt(user_mgr + self.user_manager_offsets.mUserType) == 1
end

-- Return User PlayerID in Player Career Mode
function FCECareerModeUserManager:GetPAPID()
    return MEMORY:ReadInt(self:GetAddr() + self.user_manager_offsets.mPlayerId)
end

function FCECareerModeUserManager:PlayerIsVPRO()
    -- PLAYERID_VPRO = 30999
    return self:GetPAPID() == 30999
end

return FCECareerModeUserManager;
