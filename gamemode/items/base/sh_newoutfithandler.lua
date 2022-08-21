ITEM.name = "Better Outfits"
ITEM.desc = "A not-so-trash outfit base without PAC support."
ITEM.category = "Outfit"
ITEM.model = "models/Gibs/HGIBS.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.outfitCategory = "the clothing item's body selection"
ITEM.changeToModel = NULL -- the new model the player will have
ITEM.changeToBodygroup = NULL -- the index of a bodygroup.
ITEM.changeToBodygroupIndex = NULL -- the index the bodygroup above will be changed to.
ITEM.changeToSkin = NULL -- the new skin the player will have
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


-- when the item is dropped, unequip it
ITEM:Hook("drop", function(item)
	item:Unequip
end)

-- unequip the item
ITEM.functions.EquipUn = { -- sorry, for name order.
	name = "Unequip",
	tip = "equipTip",
	icon = "icon16/cross.png",
	OnRun = function(item)
		item:SetData("equip", false)
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
		local ply = item.player
		
		-- ORDER MATTERS.
		-- must check bodygroup first, since changing the model first will not save the bodygroups or skin. 
		-- I'm unsure if the skin is ever affected by bodygroups, but I'm assuming not.
		-- check: 1. bodygroup, 2. skin, and 3. model

		-- SAVE DATA TO THE ITEM.

		-- if the item is a bodygroup, then
		if item.changeToBodygroup then
			-- unequips conflicting clothing items
			item:OnEquipped()

			-- ply:GetBodygroup will return the index of the index item.changeToBodygroup that the player currently has. usually will be 0.
			item:SetData("previousCharacterBodygroupIndex", ply:GetBodygroup(item.changeToBodygroup))
			item:SetData("latestCharacterBodygroupIndex", item.changeToBodygroupIndex)
		end 

			-- if the item is a skin, then
		if item.changeToSkin then
			-- unequips conflicting clothing items
			item:OnEquipped()

			item:SetData("previousCharacterSkin", ply:GetSkin())
			item:SetData("latestCharacterSkin", item.changeToSkin)

			ply:SetSkin(item.changeToSkin)
		end	

		-- if the item is a model, then
		if item.changeToModel then

		end
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

-- ran upon equipping the item
function ITEM:OnEquipped()
	local ply = item.player
	local char = ply:GetCharacter()
	local items = char:GetInv():GetItems() -- returns a table of the player's items to go through

	for k, v in pairs(items) do
		if (v.id ~= item.id) then
			local itemTable = ix.item.instances[v.id]

			-- if the selected item is a clothing item, is equipped, and is a bodygroup item that matches the current item 
			if v.isClothingItem and v:GetData("equip", false) and then
				v.unequip
			end
		end
	end
	
end

-- ran upon unequipping the item
function ITEM:OnUnequipped()
end
