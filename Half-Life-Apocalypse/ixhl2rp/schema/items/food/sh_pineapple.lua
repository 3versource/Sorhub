ITEM.name = "Pineapple"
ITEM.description = "A Union-branded pineapple. No longer under the sea."
ITEM.model = "models/bioshockinfinite/hext_pineapple.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "physics/flesh/flesh_squishy_impact_hard4.wav",
	OnRun = function(item)
		item.player:addHunger(7000)
		item.player:addThirst(10000)
	end
}