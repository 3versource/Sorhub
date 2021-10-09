ITEM.name = "Corn"
ITEM.description = "A cob of Union-branded corn. Corny."
ITEM.model = "models/bioshockinfinite/porn_on_cob.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(10000)
		item.player:addThirst(5000)
	end
}