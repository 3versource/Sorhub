ITEM.name = "Bag of Peanuts"
ITEM.description = "A bag of Union-branded peanuts."
ITEM.model = "models/bioshockinfinite/rag_of_peanuts.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(14000)
	end
}