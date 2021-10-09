ITEM.name = "Chocolate Bar"
ITEM.description = "A bar of Union-branded chocolate. It doesn't have a golden ticket."
ITEM.model = "models/bioshockinfinite/hext_candy_chocolate.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(9000)
	end
}