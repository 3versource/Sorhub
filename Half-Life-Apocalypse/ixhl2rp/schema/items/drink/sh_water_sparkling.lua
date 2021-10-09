ITEM.name = "Sparkling Water"
ITEM.description = "A can of sparkling water."
ITEM.model = "models/props_lunk/popcan01a.mdl"
ITEM.category = "Drink"
ITEM.skin = 2
ITEM.functions.Drink = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/barnacle_gulp2.wav",
	OnRun = function(item)
		item.player:addThirst(9000)
	end
}