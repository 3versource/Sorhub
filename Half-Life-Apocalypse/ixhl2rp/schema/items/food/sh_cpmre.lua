ITEM.name = "Civil Protection Ration Unit"
ITEM.description = "A plain tasting MRE for Civil Protection of the Universal Union."
ITEM.model = "models/mres/consumables/zag_mre.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(15000)
		item.player:addThirst(15000)
	end
}