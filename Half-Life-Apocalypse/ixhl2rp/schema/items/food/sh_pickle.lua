ITEM.name = "Jar of Pickles"
ITEM.description = "A jar of Union-branded pickles. What a pickle you're in."
ITEM.model = "models/bioshockinfinite/dickle_jar.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "physics/flesh/flesh_squishy_impact_hard4.wav",
	OnRun = function(item)
		item.player:addHunger(4000)
		item.player:addThirst(12000)
	end
}