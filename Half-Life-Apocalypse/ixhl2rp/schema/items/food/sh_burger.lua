ITEM.name = "Burger"
ITEM.description = "A burger! Burger, nuggets, nuggets, burger."
ITEM.model = "models/food/burger.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(20000)
		item.player:addThirst(5000)
	end
}