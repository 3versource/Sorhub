FACTION.name = "Metropolice Force"
FACTION.description = "A metropolice unit working as Civil Protection."
FACTION.color = Color(50, 100, 150)
FACTION.pay = 10
FACTION.models = {"models/ma/hla/metropolice.mdl"}
FACTION.weapons = {"stunstick"}
FACTION.isDefault = false
FACTION.isGloballyRecognized = true
FACTION.runSounds = {[0] = "NPC_MetroPolice.RunFootstepLeft", [1] = "NPC_MetroPolice.RunFootstepRight"}

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)

	inventory:Add("pistol", 1)
	inventory:Add("stunstick", 1)
	inventory:Add("pistolammo", 2)
	inventory:Add("handheld_radio", 1)

	-- new stuff, may not work
	character:SetData("cid", id)

	inventory:Add("cid", 1, {
		name = character:GetName(),
		id = id
	})
	-- end new stuff
end

function FACTION:GetDefaultName(client)
	return character:self:GetData("id", "00000")
	--return "MPF-RCT." .. Schema:ZeroNumber(math.random(1, 99999), 5), true
end

function FACTION:OnTransfered(client)
	local character = client:GetCharacter()

	character:SetName(self:GetDefaultName())
	character:SetModel(self.models[1])
end

function FACTION:OnNameChanged(client, oldValue, value)
	local character = client:GetCharacter()

	if (!Schema:IsCombineRank(oldValue, "RCT") and Schema:IsCombineRank(value, "RCT")) then
		character:JoinClass(CLASS_MPR)s
	end
	else
		-- experimental
		character:JoinClass(CLASS_MPU)
	end
		
	elseif (!Schema:IsCombineRank(oldValue, "SCN") and Schema:IsCombineRank(value, "SCN")
	or !Schema:IsCombineRank(oldValue, "SHIELD") and Schema:IsCombineRank(value, "SHIELD")) then
		character:JoinClass(CLASS_MPS)
	end
end

FACTION_MPF = FACTION.index
