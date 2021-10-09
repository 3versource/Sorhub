ITEM.name = "Beer"
ITEM.description = "A large brown bottle of beer. Ameeeerica!"
ITEM.model = "models/props_junk/garbage_glassbottle001a.mdl"
ITEM.category = "Drink"
ITEM.functions.Drink = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/barnacle_gulp2.wav",
	OnRun = function(item)
		item.player:addThirst(6000)
		item.player:addHunger(1000)
	end
}