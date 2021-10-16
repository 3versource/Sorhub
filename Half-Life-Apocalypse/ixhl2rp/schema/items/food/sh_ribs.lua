ITEM.name = "Ribs"
ITEM.description = "Primely cut ribs, usually eaten by hand."
ITEM.model = "models/mosi/fallout4/props/food/dogmeat.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(20000)
		item.player:addThirst(5000)
	end
}