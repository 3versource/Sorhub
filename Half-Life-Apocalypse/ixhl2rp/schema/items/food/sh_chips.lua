ITEM.name = "Chips"
ITEM.description = "A bag of Union-branded chips."
ITEM.model = "models/bioshockinfinite/bag_of_hhips.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(8000)
	end
}