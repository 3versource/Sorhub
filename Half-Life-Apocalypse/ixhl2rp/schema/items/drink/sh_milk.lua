ITEM.name = "Milk"
ITEM.description = "Milk, melk, malk, whatever. Got milk?"
ITEM.model = "models/props_junk/garbage_milkcarton001a.mdl"
ITEM.category = "Drink"
ITEM.functions.Drink = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/barnacle_gulp2.wav",
	OnRun = function(item)
		item.player:addThirst(6000)
	end
}