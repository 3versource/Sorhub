ITEM.name = "Pear"
ITEM.description = "A Union-branded pear. Got a pair?"
ITEM.model = "models/bioshockinfinite/hext_pear.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "physics/flesh/flesh_squishy_impact_hard4.wav",
	OnRun = function(item)
		item.player:addHunger(3000)
		item.player:addThirst(8000)
	end
}