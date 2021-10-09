ITEM.name = "Citizen Ration Unit"
ITEM.description = "A nasty tasting MRE for low priority citizens."
ITEM.model = "models/mres/consumables/tag_mre.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(10000)
		item.player:addThirst(10000)
	end
}