ITEM.name = "Loaf of Bread"
ITEM.description = "A loaf of Union-branded bread."
ITEM.model = "models/bioshockinfinite/dread_loaf.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(16000)
	end
}