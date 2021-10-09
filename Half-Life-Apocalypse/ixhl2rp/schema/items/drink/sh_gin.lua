ITEM.name = "Gin"
ITEM.description = "A bottle of Union-branded Gin."
ITEM.model = "models/bioshockinfinite/jin_bottle.mdl"
ITEM.category = "Drink"
ITEM.functions.Drink = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/barnacle_gulp2.wav",
	OnRun = function(item)
		item.player:addThirst(5000)
	end
}