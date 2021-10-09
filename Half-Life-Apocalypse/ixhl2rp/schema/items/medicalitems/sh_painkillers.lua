
ITEM.name = "Painkillers"
ITEM.model = Model("models/w_models/weapons/w_eq_painpills.mdl")
ITEM.description = "A container of painkillers."
ITEM.category = "Medical"

ITEM.functions.Swallow = {
	sound = "items/medshot4.wav",
	icon = "icon16/heart.png",
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 10, client:GetMaxHealth()))
	end
}
