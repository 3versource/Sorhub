ITEM.name = "Cabbage"
ITEM.description = "A green, mean, round cabbage."
ITEM.model = "models/foodnhouseholditems/cabbage1.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(5000)
		item.player:addThirst(15000)
	end
}