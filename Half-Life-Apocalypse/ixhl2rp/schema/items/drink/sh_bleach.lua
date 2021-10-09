ITEM.name = "Bleach"
ITEM.description = "Alt+F4 your life with this!"
ITEM.model = "models/props_junk/garbage_plasticbottle001a.mdl"
ITEM.category = "Drink"
ITEM.functions.Drink = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/barnacle_gulp2.wav",
	OnRun = function(item)
		item.player:TakeDamage(75)
		item.player:addThirst(-10000)
	end
}