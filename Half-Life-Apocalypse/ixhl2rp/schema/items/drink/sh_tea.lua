ITEM.name = "Tea"
ITEM.description = "An unusual bottle of Union-branded tea."
ITEM.model = "models/bioshockinfinite/ebsinthebottle.mdl"
ITEM.category = "Drink"
ITEM.functions.Drink = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/barnacle_gulp2.wav",
	OnRun = function(item)
		item.player:addThirst(7000)
	end
}