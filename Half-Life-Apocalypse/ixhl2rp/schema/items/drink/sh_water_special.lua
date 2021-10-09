ITEM.name = "Flavored Water"
ITEM.description = "A can of apple-flavored water."
ITEM.model = "models/props_lunk/popcan01a.mdl"
ITEM.category = "Drink"
ITEM.skin = 1
ITEM.functions.Drink = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/barnacle_gulp2.wav",
	OnRun = function(item)
		item.player:addThirst(9500)
		item.player:addHunger(1000)
	end
}