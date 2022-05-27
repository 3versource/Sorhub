local PLUGIN = PLUGIN
PLUGIN.name = "Needs"
PLUGIN.author = "OctraSource"
PLUGIN.desc = "Adds the logic/data needed for a needs system."
PLUGIN.defaultMax = 100

ix.util.Include("sv_plugin.lua")

local playerMeta = FindMetaTable("Player")

-- returns the raw data of the player's hunger
function playerMeta:getHunger()
	return self:GetCharacter():GetData("hunger", PLUGIN.defaultMax)
end