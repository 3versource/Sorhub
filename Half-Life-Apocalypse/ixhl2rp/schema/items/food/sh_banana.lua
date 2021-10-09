ITEM.name = "Banana"
ITEM.description = "A yellow Union-branded banana."
ITEM.model = "models/bioshockinfinite/hext_banana.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cup.png",
	sound = "physics/flesh/flesh_squishy_impact_hard4.wav",
	OnRun = function(item)
		item.player:addHunger(10000)
		item.player:addThirst(1000)
	end
}