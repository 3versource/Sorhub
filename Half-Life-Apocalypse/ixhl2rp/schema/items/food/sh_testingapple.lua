ITEM.name = "Apple"
ITEM.description = "A red Union-branded apple."
ITEM.model = "models/bioshockinfinite/hext_apple.mdl"
ITEM.category = "Food"
ITEM.hungerRecov = 4000
ITEM.thirstRecov = 10000
ITEM.isFood = true

ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "physics/flesh/flesh_squishy_impact_hard4.wav",
	OnRun = function(item)
		item.player:addHunger(4000)
		item.player:addThirst(10000)
	end
}
ITEM.hungerRecov = 4000
ITEM.thirstRecov = 10000