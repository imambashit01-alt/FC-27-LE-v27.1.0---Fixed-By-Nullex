--
local ball_size_var = "AttribDBRuntime_gameplayattribdb/gp_physics/gp_physics_soccerball/Soccerball_Radius"
local max_assistance_duration_var = "AttribDBRuntime_gameplayattribdb/gp_ballhandler/gp_ballhandler_freemove/TrackBackAssistance_MaxAssistanceDuration"


-- default values
LE.gameplay_attribulator_manager:SetFloatValue(ball_size_var, 0.365)
LE.gameplay_attribulator_manager:SetIntValue(max_assistance_duration_var, 90)

-- Test Float using ball size
assert(LE.gameplay_attribulator_manager:GetVarType(ball_size_var) == "float", "Soccerball_Radius is not a float")

local org_ball_size = LE.gameplay_attribulator_manager:GetFloatValue(ball_size_var)
assert(tonumber(string.format("%.3f", org_ball_size)) == 0.365, string.format("Soccerball_Radius %.3f != 0.365", org_ball_size))

LE.gameplay_attribulator_manager:SetFloatValue(ball_size_var, 1.35)
local new_ball_size = LE.gameplay_attribulator_manager:GetFloatValue(ball_size_var)
assert(tonumber(string.format("%.3f", new_ball_size)) == 1.350, string.format("New Soccerball_Radius %.3f != 1.35", new_ball_size))

-- Test Int
assert(LE.gameplay_attribulator_manager:GetVarType(max_assistance_duration_var) == "__int32", "TrackBackAssistance_MaxAssistanceDuration is not an int")

local org_max_assistance_duration = LE.gameplay_attribulator_manager:GetIntValue(max_assistance_duration_var)
assert(org_max_assistance_duration == 90, string.format("TrackBackAssistance_MaxAssistanceDuration %d != 90", org_max_assistance_duration))

LE.gameplay_attribulator_manager:SetIntValue(max_assistance_duration_var, 180)
local new_max_assistance_duration = LE.gameplay_attribulator_manager:GetIntValue(max_assistance_duration_var)
assert(new_max_assistance_duration == 180, string.format("New TrackBackAssistance_MaxAssistanceDuration %d != 180", new_max_assistance_duration))

-- Restore default values
LE.gameplay_attribulator_manager:SetFloatValue(ball_size_var, org_ball_size)
LE.gameplay_attribulator_manager:SetIntValue(max_assistance_duration_var, org_max_assistance_duration)
