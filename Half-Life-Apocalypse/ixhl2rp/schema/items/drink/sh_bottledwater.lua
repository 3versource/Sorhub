ITEM.name = "Bottled Water"
ITEM.description = "A pre-war bottle of water."
ITEM.model = "models/misery/the_bottle_of_water.mdl"
ITEM.category = "Drink"
ITEM.functions.Drink = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/barnacle_gulp2.wav",
	OnRun = function(item)
		item.player:addThirst(14000)
	end
}