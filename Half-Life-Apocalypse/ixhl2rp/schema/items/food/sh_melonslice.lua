ITEM.name = "Melon Slice"
ITEM.description = "A slice of a once giant ball of green."
ITEM.model = "models/props_junk/watermelon01_chunk01b.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "physics/flesh/flesh_squishy_impact_hard4.wav",
	OnRun = function(item)
		item.player:addHunger(4000)
		item.player:addThirst(16000)
	end
}