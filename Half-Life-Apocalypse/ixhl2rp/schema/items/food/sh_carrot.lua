ITEM.name = "Carrot"
ITEM.description = "A carrot. Too bad it can't actually fix blindness."
ITEM.model = "models/foodnhouseholditems/carrot.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(10000)
		item.player:addThirst(5000)
	end
}