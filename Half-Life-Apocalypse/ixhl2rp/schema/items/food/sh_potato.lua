ITEM.name = "Potato"
ITEM.description = "A Union-branded potato."
ITEM.model = "models/bioshockinfinite/hext_potato.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(8000)
	end
}