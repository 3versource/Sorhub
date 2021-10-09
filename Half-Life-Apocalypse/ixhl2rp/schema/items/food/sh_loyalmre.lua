ITEM.name = "Loyalist Ration Unit"
ITEM.description = "A plain tasting MRE for loyalists of the Universal Union."
ITEM.model = "models/mres/consumables/pag_mre.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(11000)
		item.player:addThirst(11000)
	end
}