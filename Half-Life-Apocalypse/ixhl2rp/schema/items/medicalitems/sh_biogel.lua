
ITEM.name = "Biogel"
ITEM.model = Model("models/healthvial.mdl")
ITEM.description = "A vial of Biogel."
ITEM.category = "Medical"

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	icon = "icon16/heart.png",
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 50, client:GetMaxHealth()))
	end
}
