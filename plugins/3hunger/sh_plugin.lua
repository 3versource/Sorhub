local PLUGIN = PLUGIN
PLUGIN.name = "Hunger"
PLUGIN.author = "OctraSource"
PLUGIN.desc = "Adds the logic/data needed for a hunger system."
PLUGIN.hungrySeconds = 21600

local playerMeta = FindMetaTable("Player")

-- returns the raw data of the player's hunger
function playerMeta:getHunger()
	return (self:GetNetVar("hunger")) or 0
end

-- returns the seconds remaining for the player's life
function playerMeta:getElapsedHunger()
	return (PLUGIN.hungrySeconds - (CurTime() - self:getHunger()))
end

-- returns the current percentage of hunger left
function playerMeta:getHungerPercent()
	return (self:getElapsedHunger() / PLUGIN.hungrySeconds) * 100
end

-- add hunger
function playerMeta:addHunger(amount)
	-- set a variable equivalent to the player's current hunger data
	local curHunger = CurTime() - self:getHunger()

	-- set the player's hunger data to the old data + the new amount
	self:SetNetVar("hunger", 
		CurTime() - math.Clamp(math.min(curHunger, PLUGIN.hungrySeconds) - amount, 0, PLUGIN.hungrySeconds)
	)
end
	
-- upon character presave,
function PLUGIN:CharacterPreSave(character)
	-- set a variable equivalent to the player's current hunger data
	local savedHunger = math.Clamp(CurTime() - character.player:getHunger(), 0, PLUGIN.hungrySeconds)
	-- set the player's hunger data to the newly stored hunger data
	character:SetData("hunger", savedHunger)
end

function PLUGIN:PlayerDeath(client)
	-- refill the player's hunger
	client.refillHunger = true
end

-- upon player spawn,
function PLUGIN:PlayerSpawn(client)
	-- if the client should refill hunger, then
	if (client.refillHunger) then
		-- set the player's hunger data to the current time
		client:SetNetVar("hunger", CurTime())
		-- don't refill the player's hunger
		client.refillHunger = false
	end
end

-- upon player think,
function PLUGIN:PlayerPostThink(client)
	-- if the player's percentage isn't -1, then
	if (client:getHungerPercent() != -1) then
		-- store their current percentage - 1
		local percent = (client:getHungerPercent() - 1)
		-- if their percentage is less than 1, then
		if (percent <= 1) then
			-- set the player's health to one less than it is
			client:SetHealth(client:Health() - 1)
			-- if the player's health is less than zero, then
			if(client:Health() <= 0) then
				-- kill the player
				client:TakeDamage(999)
				-- note: can't do client:Kill() because it loops them in a death forever
				-- technically that means that dead players can be killed again.
				-- huh.
			end
		end
	end
end

-- upon the player loading their character,
function PLUGIN:PlayerLoadedCharacter(client, character, lastChar)
	-- if the player has data on hunger, then
	if(character:GetData("hunger") != nil) then
		-- set the player's hunger data to their stored data
		client:SetNetVar("hunger", CurTime() - character:GetData("hunger"))
	end
	-- if the player has no data on hunger, then
	if(character:GetData("hunger") == nil) then
		-- set the player's hunger data to the current time
		client:SetNetVar("hunger", CurTime())
	end
end