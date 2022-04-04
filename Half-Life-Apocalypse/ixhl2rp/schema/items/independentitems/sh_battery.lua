ITEM.name = "Union Battery"
ITEM.model = Model("models/props_c17/TrapPropeller_Lever.mdl")
ITEM.description = "A small battery-like object with a bright blue line."
ITEM.category = "Armor Repair"

ITEM.functions.Charge = {
	sound = "items/medshot4.wav",
	icon =  "icon16/lightning.png",
	if(self:IsCombine()) then
		OnRun = function(itemTable)
			local client = itemTable.player

			client:SetArmor(math.min(client:Armor() + 20, 100))
			client:SetHealth(math.min(client:Health() - 5, client:GetMaxHealth()))
			if client:Health() <= 0 then
				client:TakeDamage(100)
			end
		end
	end
}
