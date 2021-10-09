ITEM.name = "Sardines"
ITEM.description = "A box of Union-branded sardines."
ITEM.model = "models/bioshockinfinite/cardine_can_open.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(17000)
		item.player:addThirst(6000)
	end
}