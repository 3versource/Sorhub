ITEM.name = "Cheesecake"
ITEM.description = "A delicious slice of cheesecake. It's so velvety!"
ITEM.model = "models/mosi/fallout4/props/food/radroachsteak.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(6000)
        item.player:addThirst(1000)
	end
}