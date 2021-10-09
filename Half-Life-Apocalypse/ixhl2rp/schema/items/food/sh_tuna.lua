ITEM.name = "Tuna"
ITEM.description = "A grey can containing a smelly fish."
ITEM.model = "models/stalker/tourist's breakfast.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "physics/flesh/flesh_squishy_impact_hard4.wav",
	OnRun = function(item)
		item.player:addHunger(16000)
		item.player:addThirst(6000)
	end
}