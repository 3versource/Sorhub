ITEM.name = "Better Outfits"
ITEM.description = "A not-so-trash outfit base without PAC support."
ITEM.category = "Outfit"
ITEM.model = "models/Gibs/HGIBS.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.outfitCategory = "the clothing item's body selection"
-- currently: pants, torso, head, hands, eyes, mouth

ITEM.playermodelBodygroupAndVariants = NULL -- table of pairs (bodygroup, variant), (bodygroup, variant)
-- so if index 1 = 1 and index 2 = 1, bodygroup type 1 will be set to variant 1
-- whatever the 1st bodygroup is of the model will have its variant changed to 1
ITEM.playermodelBodygroupChanges = 1
-- the amount of bodygroup changes an item will have (default = 1)

-- ITEM.playermodel = NULL
-- ITEM.playermodelSkin = NULL -- the new skin the player will have
ITEM.isClothingItem = true
ITEM.isBagItem = false

-- draws the small square on an item when the item is equipped
if (CLIENT) then
	function ITEM:PaintOver(item, w, h)
		if (item:GetData("equip")) then
			surface.SetDrawColor(110, 255, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

-- unequip the item
ITEM.functions.EquipUn = { -- sorry, for name order.
	name = "Unequip",
	tip = "equipTip",
	icon = "icon16/cross.png",
	OnRun = function(item)
		item:OnUnequipped()
		return false
	end,
	OnCanRun = function(item)
		-- if the item isn't valid and currently not equipped, return false (only appears when item is equipped)
		return (!IsValid(item.entity) and item:GetData("equip") == true)
	end
}

-- equip the item
ITEM.functions.Equip = {
	name = "Equip",
	tip = "equipTip",
	icon = "icon16/tick.png",
	OnRun = function(item)
		item:OnEquipped(false)
		return false
		end,
	OnCanRun = function(item)
		return (!IsValid(item.entity) and item:GetData("equip") ~= true)
	end
}

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	if (newInventory and self:GetData("equip")) then
		return false
	end

	return true
end

-- equips the clothing item specified
function ITEM:OnEquipped(justChange, initialPly)
	-- "self" refers to "item"
	local ply = self.player or initialPly -- upon the hook being ran, self.player does not exist (because the item hasn't loaded yet)
	local char = ply:GetCharacter()
	local items = char:GetInv():GetItems() -- returns a table of the player's items to go through


	if justChange then
		for i = 1, (self.playermodelBodygroupChanges*2), 2 do
			-- sets the player's model to the bodygroup specified
			ply:SetBodygroup(self.playermodelBodygroupAndVariants[i], self.playermodelBodygroupAndVariants[i+1])
		end
	else
		for k, v in pairs(items) do
			if (v.id ~= self.id) then
				local itemTable = ix.item.instances[v.id]

				-- if the selected item is a clothing item, is equipped, and is the same category as the super item, then
				if v.isClothingItem and v:GetData("equip") and v.outfitCategory == self.outfitCategory then
					-- unequip the conflicting item
					v:OnUnequipped(self.player)
				end
			end
		end

		-- ORDER MATTERS.
		-- 1. model 2. bodygroup 3. skin
		-- SAVE DATA TO THE ITEM.

		-- if the item is a bodygroup, then
		if self.playermodelBodygroupAndVariants then
			-- a table that will store the player's previous bodygroups and their variants
			local previousBodygroupsAndVariants = {}

			-- starts at 1, skips every other index
			for i = 1, (self.playermodelBodygroupChanges*2), 2 do
				-- sets the 1st part of the pair equal to the bodygroup type's index
				previousBodygroupsAndVariants[i] = self.playermodelBodygroupAndVariants[i]
				-- sets the 2nd part of the pair equal to the bodygroup variant's index within the bodygroup type (1, 1 means set the torso to variant 1)
				previousBodygroupsAndVariants[i+1] = ply:GetBodygroup(previousBodygroupsAndVariants[i])

				-- print("saved "..previousBodygroupsAndVariants[i].." with it set to "..previousBodygroupsAndVariants[i+1])
				-- print("setting "..self.playermodelBodygroupAndVariants[i].." to "..self.playermodelBodygroupAndVariants[i+1])

				-- sets the player's model to the bodygroup specified
				ply:SetBodygroup(self.playermodelBodygroupAndVariants[i], self.playermodelBodygroupAndVariants[i+1])
			end
		-- saves the player's previous bodygroups and variants
		self:SetData("previousBodygroupsAndVariants", previousBodygroupsAndVariants)
		end 
	end

	self:SetData("equip", true)
end

-- unequips the clothing item specified
function ITEM:OnUnequipped(player)
	-- "self" refers to "item"
	local ply = self.player or player

	for i = 1, (self.playermodelBodygroupChanges*2), 2 do
		ply:SetBodygroup(self:GetData("previousBodygroupsAndVariants")[i], self:GetData("previousBodygroupsAndVariants")[i+1])
		self:SetData("previousBodygroupsAndVariants", NULL)
	end

	self:SetData("equip", false)
end

-- when the item is dropped, unequip it
ITEM:Hook("drop", function(item)
	if item:GetData("equip") then
		item:OnUnequipped()
	end
end)

-- when the player spawns,
hook.Add("PlayerLoadedCharacter", "equipClothes", function(client, character)
	-- set their bodygroups to all of their equipped clothing
	local items = character:GetInv():GetItems() -- returns a table of the player's items to go through
	for k, v in pairs(items) do
		-- local itemTable = ix.item.instances[v.id]
		-- if the selected item is a clothing item and is equipped, then
		if v.isClothingItem and v:GetData("equip", true) then
			-- set the player's bodygroups
			v:OnEquipped(true, client)
		end
	end
end)