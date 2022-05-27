local PLUGIN = PLUGIN
local playerMeta = FindMetaTable("Player")

-- add hunger
function playerMeta:addHunger(amount)
	local char = self:GetCharacter()

	if !char then return end

	char:SetData("hunger", char:GetData("hunger", PLUGIN.defaultMax) + amount)
end

function PLUGIN:PlayerDeath(client)
	client.refill = true
end

-- upon player spawn,
function PLUGIN:PlayerSpawn(client)
	local char = client:GetCharacter()

	if !char then return end

	if(client.refill or false) then
		char:SetData("hunger", PLUGIN.defaultMax)
		client.refill = false
	end
end

-- upon player think, (essentially runs continuously)
function PLUGIN:PlayerPostThink(client)
	local time = CurTime()
	local char = client:GetCharacter()
	
	if !char then return end

	print(char:GetData("hunger", "not found"))

	if (client.nextCooldown or 0) < time then
		char:SetData("hunger", char:GetData("hunger", PLUGIN.defaultMax) - 1)

		client.nextCooldown = time + 1
	end

	if char:GetData("hunger") == 0 then
		client:TakeDamage(999)
	end
end

-- upon the player loading their character,
function PLUGIN:PlayerLoadedCharacter(client, character, lastChar)
	character:SetData("hunger", character:GetData("hunger", PLUGIN.defaultMax))
end