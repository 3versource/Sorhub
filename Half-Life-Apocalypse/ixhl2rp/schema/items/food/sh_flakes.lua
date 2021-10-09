ITEM.name = "Bran-flakes"
ITEM.description = "A box of Union-branded 'Bran'-flakes."
ITEM.model = "models/bioshockinfinite/hext_cereal_box_cornflakes.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(14000)
	end
}
