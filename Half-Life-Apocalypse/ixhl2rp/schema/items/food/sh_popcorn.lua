ITEM.name = "Popcorn"
ITEM.description = "A box of Union-branded popcorn. Floss your teeth."
ITEM.model = "models/bioshockinfinite/topcorn_bag.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(5000)
	end
}