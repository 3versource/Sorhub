local PLUGIN = PLUGIN
PLUGIN.name = "Thirst"
PLUGIN.author = "OctraSource"
PLUGIN.desc = "Adds a thirst bar that allows players to die of thirst."
PLUGIN.thirstySeconds = 14400


local playerMeta = FindMetaTable("Player")
local entityMeta = FindMetaTable("Entity")

function playerMeta:getThirst()
	return (self:GetNetVar("thirst")) or 0
end

function playerMeta:getThirstPercent()
	return math.Clamp(((CurTime() - self:getThirst()) / PLUGIN.thirstySeconds), 0 ,1)
end

function playerMeta:addThirst(amount)
	local curThirst = CurTime() - self:getThirst()

	self:SetNetVar("thirst", 
		CurTime() - math.Clamp(math.min(curThirst, PLUGIN.thirstySeconds) - amount, 0, PLUGIN.thirstySeconds)
	)
end

if (CLIENT) then
	local color = Color(135,206,250)

	do
		 ix.bar.Add(function()
			return (1 - LocalPlayer():getThirstPercent())
		end, color, nil, "thirst")
	end

	local thirstBar, percent, wave
	function PLUGIN:Think()
	end

	local timers = {5, 15, 30}

else
	local PLUGIN = PLUGIN

	function PLUGIN:LoadData()
		if (true) then return end
		
		local savedTable = self:GetData() or {}
	end
	
	function PLUGIN:SaveData()
		if (true) then return end
		local savedTable = {}
		self:SetData(savedTable)
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

	local thinkTime = CurTime()
	function PLUGIN:PlayerPostThink(client)
		if (1 < 2) then
			local percent = (client:getThirstPercent() - 1)

			if (percent == 0) then
					client.TakeDamage(client, .05)
					return
			end
		end
	end

	function PLUGIN:CharacterLoaded(client, character)
		client:SetNetVar("thirst", CurTime() - character:GetData("thirst"))
	end
end