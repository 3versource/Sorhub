
ITEM.name = "Biokit"
ITEM.model = Model("models/items/healthkit.mdl")
ITEM.description = "A white container with biogel on the side."
ITEM.category = "Medical"

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	icon = "icon16/heart.png",
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 80, 100))
	end
}
