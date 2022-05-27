local PLUGIN = PLUGIN
local playerMeta = FindMetaTable("Player")

function playerMeta:addHunger(amount)
	local char = self:GetCharacter()

	if !char then return end

	char:SetData("hunger", math.Clamp((char:GetData("hunger", PLUGIN.defaultMax) + amount), 0, PLUGIN.defaultMax))
end

function playerMeta:addThirst(amount)
	local char = self:GetCharacter()

	if !char then return end

	char:SetData("hunger", math.Clamp((char:GetData("hunger", PLUGIN.defaultMax) + amount), 0 , PLUGIN.defaultMax))
end

function PLUGIN:PlayerDeath(client)
	client.refill = true
end

function PLUGIN:PlayerSpawn(client)
	local char = client:GetCharacter()

	if !char then return end

	if(client.refill or false) then
		char:SetData("hunger", PLUGIN.defaultMax)
		char:SetData("thirst", PLUGIN.defaultMax)
		client.refill = false
	end
end

function PLUGIN:PlayerPostThink(client)
	local time = CurTime()
	local char = client:GetCharacter()
	
	if !char or !client:Alive() then return end

	if (client.nextCooldownHunger or 0) < time then
		char:SetData("hunger", char:GetData("hunger", PLUGIN.defaultMax) - 1)

		client.nextCooldownHunger = time + 180
	end

	if (client.nextCooldownThirst or 0) < time then
		char:SetData("thirst", char:GetData("thirst", PLUGIN.defaultMax) - 1)

		client.nextCooldownThirst = time + 120
	end

	if (char:GetData("hunger") < 0) or (char:GetData("thirst") < 0) then
		client:SetHealth(client:Health() - 1)
		if client:Health() < 1 then
			client:TakeDamage(999)
		end
	end
end

function PLUGIN:PlayerLoadedCharacter(client, character, lastChar)
	character:SetData("hunger", character:GetData("hunger", PLUGIN.defaultMax))
	character:SetData("thirst", character:GetData("thirst", PLUGIN.defaultMax))
end