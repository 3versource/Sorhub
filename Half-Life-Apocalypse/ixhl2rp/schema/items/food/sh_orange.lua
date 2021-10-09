ITEM.name = "Orange"
ITEM.description = "An orange Union-branded orange. Orange orange."
ITEM.model = "models/bioshockinfinite/hext_orange.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "physics/flesh/flesh_squishy_impact_hard4.wav",
	OnRun = function(item)
		item.player:addHunger(4000)
		item.player:addThirst(9000)
	end
}