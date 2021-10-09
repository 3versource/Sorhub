ITEM.name = "Apple"
ITEM.description = "A red Union-branded apple."
ITEM.model = "models/bioshockinfinite/hext_apple.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "physics/flesh/flesh_squishy_impact_hard4.wav",
	OnRun = function(item)
		item.player:addHunger(4000)
		item.player:addThirst(10000)
	end
}