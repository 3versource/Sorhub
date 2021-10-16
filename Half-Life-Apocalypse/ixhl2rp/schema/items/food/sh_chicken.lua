ITEM.name = "Grilled Chicken"
ITEM.description = "A piece of grilled chicken breast."
ITEM.model = "models/mosi/fallout4/props/food/radroachsteak.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(18000)
        item.player:addThirst(3000)
	end
}