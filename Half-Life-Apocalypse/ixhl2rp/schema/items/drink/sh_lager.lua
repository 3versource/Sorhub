ITEM.name = "Lager"
ITEM.description = "A bottle of Union-branded Lager."
ITEM.model = "models/bioshockinfinite/hext_bottle_lager.mdl"
ITEM.category = "Drink"
ITEM.functions.Drink = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/barnacle_gulp2.wav",
	OnRun = function(item)
		item.player:addThirst(4000)
	end
}