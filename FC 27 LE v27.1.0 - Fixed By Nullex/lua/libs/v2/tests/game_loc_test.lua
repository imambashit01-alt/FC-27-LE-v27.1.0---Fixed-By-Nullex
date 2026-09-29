local org_CM_YouthTeamName = LE.game_localization_manager:GetString("CM_YouthTeamName")
local org_clubleague_easterneurope = LE.game_localization_manager:GetString("clubleague_easterneurope")

assert(org_CM_YouthTeamName == "the youth ranks", string.format("CM_YouthTeamName %s != the youth ranks", org_CM_YouthTeamName))
assert(org_clubleague_easterneurope == "Eastern Europe", string.format("clubleague_easterneurope %s != Eastern Europe", org_clubleague_easterneurope))


print(org_CM_YouthTeamName)
print(org_clubleague_easterneurope)

LE.game_localization_manager:SetString("CM_YouthTeamName", "blyblybly")
local new_CM_YouthTeamName = LE.game_localization_manager:GetString("CM_YouthTeamName")
assert(new_CM_YouthTeamName == "blyblybly", string.format("CM_YouthTeamName %s != blyblybly", new_CM_YouthTeamName))

local long_str = "VeryLong256CharactersStringWithSomeRandomSpecialCharacterInIT96126916^&*(#!@^%AFXZsbbCVXNFD:OIL:OI{P';lkm,>M<NMBJGZCxzczw12#%^&*()_@#!@$##@^#YTGFDBVCVZXVADGEQTQT#!^TTFGDVSDXZVFXVXCHFDSH$@%!@#@!FVaFGASGSDBVreyhegCXVSDFwqERGHYYTUGFVCXCSDWQE@!$TGBDFVXCEWR!#%"

LE.game_localization_manager:SetString("CM_YouthTeamName", long_str)
new_CM_YouthTeamName = LE.game_localization_manager:GetString("CM_YouthTeamName")
assert(new_CM_YouthTeamName == long_str, string.format("CM_YouthTeamName %s != %s", new_CM_YouthTeamName, long_str))

-- Restore default values
LE.game_localization_manager:SetString("CM_YouthTeamName", org_CM_YouthTeamName)