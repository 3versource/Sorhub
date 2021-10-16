ITEM.name = "Steak"
ITEM.description = "A steak slice, looking delicious as ever."
ITEM.model = "models/mosi/fallout4/props/food/steak.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(20000)
		item.player:addThirst(5000)
	end
}