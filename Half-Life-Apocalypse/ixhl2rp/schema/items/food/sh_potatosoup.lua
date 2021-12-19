ITEM.name = "Potato Soup"
ITEM.description = "A bowl of potato soup."
ITEM.model = "models/mosi/fallout4/props/food/iguanasoup.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(10000)
        item.player:addThirst(2000)
	end
}