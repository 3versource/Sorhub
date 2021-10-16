ITEM.name = "Ramen"
ITEM.description = "A little cute container that has ramen in it. There's no fortune cookie."
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "npc/barnacle/barnacle_gulp2.wav",
	OnRun = function(item)
		item.player:addHunger(12000)
		item.player:addThirst(2000)
	end
}