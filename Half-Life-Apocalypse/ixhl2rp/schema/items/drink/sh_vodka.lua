ITEM.name = "Vodka"
ITEM.description = "A large bottle of vodka."
ITEM.model = "models/stalker/cossacks vodka.mdl"
ITEM.category = "Drink"
ITEM.functions.Drink = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/barnacle_gulp2.wav",
	OnRun = function(item)
		item.player:addThirst(2000)
	end
}