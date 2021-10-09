ITEM.name = "Cheese"
ITEM.description = "A Union-branded wheel of cheese. Did somebody steal your wheel of cheese?"
ITEM.model = "models/bioshockinfinite/pound_cheese.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(9000)
	end
}