require 'imports/core/common'
require 'imports/career_mode/enums'
require 'imports/career_mode/consts'

-- Get FCE Career Mode Manager object.
-- Type ID in lua\libs\v2\imports\career_mode\enums.lua (ENUM_FCEGameModes)
function GetManagerObjByTypeId(type_id)
    if type(type_id) ~= "number" then
        LOGGER:LogError("GetManagerObjByTypeId passed type_id is not a number!")
        return 0
    end

    local result = 0

    local comm_impl = GetPlugin(ENUM_djb2FeFceGMCommServiceInterface_CLSS)
    if (comm_impl <= 0)  then return 0 end
    
    local mode_managers = MEMORY:ReadMultilevelPointer(comm_impl, {0x20, 0x10})
    local mode_manager = mode_managers + (0x20 * type_id)
    
    -- Check if there is any instance
    if (MEMORY:ReadInt(mode_manager + 0x10) ~= 1) then
        return 0
    end
    
    local mode_manager_type = MEMORY:ReadPointer(mode_manager + 0x8)
    -- Check count
    if (MEMORY:ReadInt(mode_manager_type + 0x10) ~= 1) then
        return 0
    end
    
    result = MEMORY:ReadMultilevelPointer(mode_manager, {0x18, 0x0})

    return result
end

function SetSquadRole(playerid, role)
    print ("TODO: FC27")
    print ("NOT IMPLEMENTED SetSquadRole")
end

function GetCMEventNameByID(event_id)
    return CONST_CM_EVENTS_NAMES[event_id] or string.format("EVENT_%d", event_id)
end

function GetUserTeamID()
    if not IsInCM() then return 0 end
    
    local user_mgr = GetManagerObjByTypeId(ENUM_FCEGameModesFCECareerModeUserManager)
    local user_info = MEMORY:ReadPointer(user_mgr + 0x18)

    local teamid = MEMORY:ReadInt(user_info + 0x1F4)
    if (teamid <= 0) then teamid = 0 end
    
    return teamid
end

function GetUserNationalTeamID()
    if not IsInCM() then return 0 end

    local user_mgr = GetManagerObjByTypeId(ENUM_FCEGameModesFCECareerModeUserManager)
    local user_info = MEMORY:ReadPointer(user_mgr + 0x18)
    
    local teamid = MEMORY:ReadInt(user_info + 0x268)
    if (teamid <= 0) then teamid = 0 end
    
    return teamid
end

function GetUserSeniorTeamPlayerIDs()
    print ("TODO: FC27")
    print ("NOT IMPLEMENTED GetUserSeniorTeamPlayerIDs")

    local result = {}
    return result
end

function UserTeamSetPlayersForm(v)
    print ("TODO: FC27")
    print ("NOT IMPLEMENTED UserTeamSetPlayersForm")
end

function UserTeamSetPlayersSharpness(v)
    print ("TODO: FC27")
    print ("NOT IMPLEMENTED UserTeamSetPlayersSharpness")
end

function UserTeamSetPlayersMorale(v)
    print ("TODO: FC27")
    print ("NOT IMPLEMENTED UserTeamSetPlayersMorale")
end

function UserTeamSetPlayersFormSharpnessMorale(v_form, v_sharpness, v_morale)
    print ("TODO: FC27")
    print ("NOT IMPLEMENTED UserTeamSetPlayersFormSharpnessMorale")
end

function UserTeamSetPlayersFitness(v_fitness)
    print ("TODO: FC27")
    print ("NOT IMPLEMENTED UserTeamSetPlayersFitness")
end
