
ITEM.name = "Medikit"
ITEM.model = Model("models/w_models/weapons/w_eq_medkit.mdl")
ITEM.description = "A red bag with medical supplies."
ITEM.category = "Medical"

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	icon = "icon16/heart.png",
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 40, 100))
	end
}
