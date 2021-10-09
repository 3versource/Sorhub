ITEM.name = "Apple Juice Carton"
ITEM.description = "A pre-war carton of apple juice."
ITEM.model = "models/foodnhouseholditems/juicesmall.mdl"
ITEM.category = "Drink"
ITEM.functions.Drink = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/barnacle_gulp2.wav",
	OnRun = function(item)
		item.player:addThirst(9000)
		item.player:addHunger(1000)
	end
}