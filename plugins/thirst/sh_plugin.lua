local PLUGIN = PLUGIN
PLUGIN.name = "Thirst"
PLUGIN.author = "OctraSource"
PLUGIN.desc = "Adds the logic/data needed for a thirst system."
PLUGIN.thirstySeconds = 14400

local playerMeta = FindMetaTable("Player")

function playerMeta:getThirst()
	return (self:GetNetVar("thirst")) or 0
end

function playerMeta:getElapsedThirst()
	return (PLUGIN.thirstySeconds - (CurTime() - self:getThirst()))
end

function playerMeta:getThirstPercent()
	return (self:getElapsedThirst() / PLUGIN.thirstySeconds) * 100
end

function playerMeta:addThirst(amount)
	local curThirst = CurTime() - self:getThirst()

	self:SetNetVar("thirst", 
		CurTime() - math.Clamp(math.min(curThirst, PLUGIN.thirstySeconds) - amount, 0, PLUGIN.thirstySeconds)
	)
end
	
function PLUGIN:CharacterPreSave(character)
	local savedThirst = math.Clamp(CurTime() - character.player:getThirst(), 0, PLUGIN.thirstySeconds)
	character:SetData("thirst", savedThirst)
end

function PLUGIN:PlayerDeath(client)
	client.refillThirst = true
end

function PLUGIN:PlayerSpawn(client)
	if (client.refillThirst) then
		client:SetNetVar("thirst", CurTime())
		client.refillThirst = false
	end
end

function PLUGIN:PlayerPostThink(client)
	if (client:getThirstPercent() != -1) then
		local percent = (client:getThirstPercent() - 1)
		if (percent <= 1) then
			client:SetHealth(client:Health() - 1)
			if(client:Health() <= 0) then
				client:TakeDamage(999)
			end
		end
	end
end

function PLUGIN:PlayerLoadedCharacter(client, character, lastChar)
	if(character:GetData("thirst") != nil) then
		client:SetNetVar("thirst", CurTime() - character:GetData("thirst"))
	end
	if(character:GetData("thirst") == nil) then
		client:SetNetVar("thirst", CurTime())
	end
end