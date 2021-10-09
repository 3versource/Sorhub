ITEM.name = "Leek"
ITEM.description = "It's not a game leak. A green plant that grows from the ground."
ITEM.model = "models/foodnhouseholditems/leek.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(6000)
		item.player:addThirst(13000)
	end
}