ITEM.name = "Hotdog"
ITEM.description = "A hotdog, still looking fresh. What's up, dog?"
ITEM.model = "models/food/hotdog.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(19000)
	end
}