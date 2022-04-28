local PLUGIN = PLUGIN
PLUGIN.name = "Hunger Need"
PLUGIN.author = "OctraSource"
PLUGIN.desc = "Adds a needs bar that kills players if they don't eat.."
PLUGIN.hungrySeconds = 21600

local playerMeta = FindMetaTable("Player")

function playerMeta:getHunger()
	return (self:GetNetVar("hunger")) or 0
end

function playerMeta:getHungerPercent()
	return math.Clamp(((CurTime() - self:getHunger()) / PLUGIN.hungrySeconds), 0 ,1)
end

function playerMeta:addHunger(amount)
	local curHunger = CurTime() - self:getHunger()

	self:SetNetVar("hunger", 
		CurTime() - math.Clamp(math.min(curHunger, PLUGIN.hungrySeconds) - amount, 0, PLUGIN.hungrySeconds)
	)
end

if (CLIENT) then
	local color = Color(56,46,28)

	do
		 ix.bar.Add(function()
			return (1 - LocalPlayer():getHungerPercent())
		end, color, nil, "hunger")
	end

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
		if (client:getHungerPercent() ~= -1) then
			local percent = (client:getHungerPercent() - 1)

			if (percent == 0) then
					client.TakeDamage(client, .05)
					return
			end
		end
	end

	function PLUGIN:PlayerLoadedCharacter(client, character, lastChar)
		if(character:GetData("hunger") ~= nil) then
			client:SetNetVar("hunger", CurTime() - character:GetData("hunger"))
		end
		if(character:GetData("hunger") == nil) then
			client:SetNetVar("hunger", CurTime())
		end
	end
end