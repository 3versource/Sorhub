local PLUGIN = PLUGIN
PLUGIN.name = "Hunger"
PLUGIN.author = "OctraSource"
PLUGIN.desc = "Adds the logic/data needed for a hunger system."
PLUGIN.hungrySeconds = 21600

local playerMeta = FindMetaTable("Player")

function playerMeta:getHunger()
	return (self:GetNetVar("hunger")) or 0
end

function playerMeta:getElapsedHunger()
	return (PLUGIN.hungrySeconds - (CurTime() - self:getHunger()))
end

function playerMeta:getHungerPercent()
	return (self:getElapsedHunger() / PLUGIN.hungrySeconds) * 100
end

function playerMeta:addHunger(amount)
	local curHunger = CurTime() - self:getHunger()

	self:SetNetVar("hunger", 
		CurTime() - math.Clamp(math.min(curHunger, PLUGIN.hungrySeconds) - amount, 0, PLUGIN.hungrySeconds)
	)
end
	
function PLUGIN:CharacterPreSave(character)
	local savedHunger = math.Clamp(CurTime() - character.player:getHunger(), 0, PLUGIN.hungrySeconds)
	character:SetData("hunger", savedHunger)
end

function PLUGIN:PlayerDeath(client)
	client.refillHunger = true
end

function PLUGIN:PlayerSpawn(client)
	if (client.refillHunger) then
		client:SetNetVar("hunger", CurTime())
		client.refillHunger = false
	end
end

function PLUGIN:PlayerPostThink(client)
	if (client:getHungerPercent() != -1) then
		local percent = (client:getHungerPercent() - 1)
		if (percent <= 1) then
			client:SetHealth(client:Health() - 1)
			if(client:Health() <= 0) then
				client:TakeDamage(999)
			end
		end
	end
end

function PLUGIN:PlayerLoadedCharacter(client, character, lastChar)
	if(character:GetData("hunger") != nil) then
		client:SetNetVar("hunger", CurTime() - character:GetData("hunger"))
	end
	if(character:GetData("hunger") == nil) then
		client:SetNetVar("hunger", CurTime())
	end
end