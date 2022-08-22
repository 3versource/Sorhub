
if (SERVER) then
	util.AddNetworkString("ixBagDrop")
end

ITEM.name = "Bag"
ITEM.description = "A bag to hold items."
ITEM.model = "models/props_c17/suitcase001a.mdl"
ITEM.category = "Storage"
ITEM.width = 2
ITEM.height = 2
ITEM.invWidth = 4
ITEM.invHeight = 2
ITEM.outfitCategory = "backpack"
ITEM.isClothes = true
ITEM.isBag = true
ITEM.functions.View = {
	icon = "icon16/briefcase.png",
	OnClick = function(item)
		local index = item:GetData("id", "")

		if (index) then
			local panel = ix.gui["inv"..index]
			local inventory = ix.item.inventories[index]
			local parent = IsValid(ix.gui.menuInventoryContainer) and ix.gui.menuInventoryContainer or ix.gui.openedStorage

			if (IsValid(panel)) then
				panel:Remove()
			end

			if (inventory and inventory.slots) then
				panel = vgui.Create("ixInventory", IsValid(parent) and parent or nil)
				panel:SetInventory(inventory)
				panel:ShowCloseButton(true)
				panel:SetTitle(item.GetName and item:GetName() or L(item.name))

				if (parent != ix.gui.menuInventoryContainer) then
					panel:Center()

					if (parent == ix.gui.openedStorage) then
						panel:MakePopup()
					end
				else
					panel:MoveToFront()
				end

				ix.gui["inv"..index] = panel
			else
				ErrorNoHalt("[Helix] Attempt to view an uninitialized inventory '"..index.."'\n")
			end
		end

		return false
	end,
	OnCanRun = function(item)
		return !IsValid(item.entity) and item:GetData("id") and !IsValid(ix.gui["inv" .. item:GetData("id", "")])
	end
}
ITEM.functions.combine = {
	OnRun = function(item, data)
		ix.item.instances[data[1]]:Transfer(item:GetData("id"), nil, nil, item.player)

		return false
	end,
	OnCanRun = function(item, data)
		local index = item:GetData("id", "")

		if (index) then
			local inventory = ix.item.inventories[index]

			if (inventory) then
				return true
			end
		end

		return false
	end
}

if (CLIENT) then
	function ITEM:PaintOver(item, width, height)
		local panel = ix.gui["inv" .. item:GetData("id", "")]

		if (!IsValid(panel)) then
			return
		end

		if (vgui.GetHoveredPanel() == self) then
			panel:SetHighlighted(true)
		else
			panel:SetHighlighted(false)
		end
	end
end

-- Called when a new instance of this item has been made.
function ITEM:OnInstanced(invID, x, y)
	local inventory = ix.item.inventories[invID]

	ix.inventory.New(inventory and inventory.owner or 0, self.uniqueID, function(inv)
		local client = inv:GetOwner()

		inv.vars.isBag = self.uniqueID
		self:SetData("id", inv:GetID())

		if (IsValid(client)) then
			inv:AddReceiver(client)
		end
	end)
end

function ITEM:GetInventory()
	local index = self:GetData("id")

	if (index) then
		return ix.item.inventories[index]
	end
end

ITEM.GetInv = ITEM.GetInventory

-- Called when the item first appears for a client.
function ITEM:OnSendData()
	local index = self:GetData("id")

	if (index) then
		local inventory = ix.item.inventories[index]

		if (inventory) then
			inventory.vars.isBag = self.uniqueID
			inventory:Sync(self.player)
			inventory:AddReceiver(self.player)
		else
			local owner = self.player:GetCharacter():GetID()

			ix.inventory.Restore(self:GetData("id"), self.invWidth, self.invHeight, function(inv)
				inv.vars.isBag = self.uniqueID
				inv:SetOwner(owner, true)

				if (!inv.owner) then
					return
				end

				for client, character in ix.util.GetCharacters() do
					if (character:GetID() == inv.owner) then
						inv:AddReceiver(client)
						break
					end
				end
			end)
		end
	else
		ix.inventory.New(self.player:GetCharacter():GetID(), self.uniqueID, function(inv)
			self:SetData("id", inv:GetID())
		end)
	end
end

ITEM.postHooks.drop = function(item, result)
	local index = item:GetData("id")

	local query = mysql:Update("ix_inventories")
		query:Update("character_id", 0)
		query:Where("inventory_id", index)
	query:Execute()

	net.Start("ixBagDrop")
		net.WriteUInt(index, 32)
	net.Send(item.player)
end

if (CLIENT) then
	net.Receive("ixBagDrop", function()
		local index = net.ReadUInt(32)
		local panel = ix.gui["inv"..index]

		if (panel and panel:IsVisible()) then
			panel:Close()
		end
	end)
end

-- Called before the item is permanently deleted.
function ITEM:OnRemoved()
	local index = self:GetData("id")

	if (index) then
		local query = mysql:Delete("ix_items")
			query:Where("inventory_id", index)
		query:Execute()

		query = mysql:Delete("ix_inventories")
			query:Where("inventory_id", index)
		query:Execute()
	end
end

-- Called when the item should tell whether or not it can be transfered between inventories.
function ITEM:CanTransfer(oldInventory, newInventory)
	local index = self:GetData("id")

	if (newInventory) then
		if (newInventory.vars and newInventory.vars.isBag) then
			return false
		end

		local index2 = newInventory:GetID()

		if (index == index2) then
			return false
		end

		for _, v in pairs(self:GetInventory():GetItems()) do
			if (v:GetData("id") == index2) then
				return false
			end
		end
	end

	return !newInventory or newInventory:GetID() != oldInventory:GetID() or newInventory.vars.isBag
end

function ITEM:OnTransferred(curInv, inventory)
	local bagInventory = self:GetInventory()

	if (isfunction(curInv.GetOwner)) then
		local owner = curInv:GetOwner()

		if (IsValid(owner)) then
			bagInventory:RemoveReceiver(owner)
		end
	end

	if (isfunction(inventory.GetOwner)) then
		local owner = inventory:GetOwner()

		if (IsValid(owner)) then
			bagInventory:AddReceiver(owner)
			bagInventory:SetOwner(owner)
		end
	else
		-- it's not in a valid inventory so nobody owns this bag
		bagInventory:SetOwner(nil)
	end
end

-- Called after the item is registered into the item tables.
function ITEM:OnRegistered()
	ix.inventory.Register(self.uniqueID, self.invWidth, self.invHeight, true)
end

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)
		if (item:GetData("equip")) then
			surface.SetDrawColor(110, 255, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

function ITEM:removeOutfit(client)
	local character = client:GetCharacter()
	
	self:SetData("equip", false)

	if (character:GetData("oldMdl")) then
		character:setModel(character:GetData("oldMdl"))
		character:SetData("oldMdl", nil)
	end
	
	if (self.newSkin) then
		if (character:GetData("oldSkin")) then
			client:SetSkin(character:GetData("oldSkin"))
			character:SetData("oldSkin", nil)
		else
			client:SetSkin(0)
		end
	end

	for k, v in pairs(self.bodyGroups or {}) do
		local index = client:FindBodygroupByName(k)

		if (index > -1) then
			client:SetBodygroup(index, 0)

			local groups = character:GetData("groups", {})

			if (groups[index]) then
				groups[index] = nil
				character:SetData("groups", groups)
			end
		end
	end

	if (self.attribBoosts) then
		for k, _ in pairs(self.attribBoosts) do
			character:removeBoost(self.uniqueID, k)
		end
	end
end

-- On item is dropped, Remove a weapon from the player and keep the ammo in the item.
ITEM:Hook("drop", function(item)
	if (item:GetData("equip")) then
		item:removeOutfit(item.player)
	end
end)

-- On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.EquipUn = { -- sorry, for name order.
	name = "Unequip",
	tip = "equipTip",
	icon = "icon16/cross.png",
	OnRun = function(item)
		item:removeOutfit(item.player)
		
		return false
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity) and item:GetData("equip") == true)
	end
}

-- On player eqipped the item, Gives a weapon to player and load the ammo data from the item.
ITEM.functions.Equip = {
	name = "Equip",
	tip = "equipTip",
	icon = "icon16/tick.png",
	OnRun = function(item)
		local char = item.player:GetCharacter()
		local items = char:GetInv():GetItems()

		for k, v in pairs(items) do
			if (v.id ~= item.id) then
				local itemTable = ix.item.instances[v.id]

				if((v.isBag and v.outfitCategory == item.outfitCategory and itemTable:GetData("equip")) or (v.outfitCategory == "fullbody" and itemTable:GetData("equip"))) then
					item.player:NotifyLocalized("Unequip the other bag in this slot or an outfit to equip this.")
					return false
				end
			end
		end

		item:SetData("equip", true)
		
		if (type(item.onGetReplacement) == "function") then
			char:SetData("oldMdl", char:GetData("oldMdl", item.player:GetModel()))
			char:setModel(item:onGetReplacement())
		elseif (item.replacement or item.replacements) then
			char:SetData("oldMdl", char:GetData("oldMdl", item.player:GetModel()))

			if (type(item.replacements) == "table") then
				if (#item.replacements == 2 and type(item.replacements[1]) == "string") then
					char:setModel(item.player:GetModel():gsub(item.replacements[1], item.replacements[2]))
				else
					for k, v in ipairs(item.replacements) do
						char:setModel(item.player:GetModel():gsub(v[1], v[2]))
					end
				end
			else
				char:setModel(item.replacement or item.replacements)
			end
		end
		
		if (item.newSkin) then
			char:SetData("oldSkin", item.player:GetSkin())
			item.player:SetSkin(item.newSkin)
		end
		
		if (item.bodyGroups) then
			local groups = {}

			for k, value in pairs(item.bodyGroups) do
				local index = item.player:FindBodygroupByName(k)

				if (index > -1) then
					groups[index] = value
				end
			end

			local newGroups = char:GetData("groups", {})

			for index, value in pairs(groups) do
				newGroups[index] = value
				item.player:SetBodygroup(index, value)
			end

			if (table.Count(newGroups) > 0) then
				char:SetData("groups", newGroups)
			end
		end

		if (item.attribBoosts) then
			for k, v in pairs(item.attribBoosts) do
				char:addBoost(item.uniqueID, k, v)
			end
		end
		
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

function ITEM:OnEquipped()
end

function ITEM:OnUnequipped()
end
