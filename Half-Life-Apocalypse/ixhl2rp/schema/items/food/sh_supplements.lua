ITEM.name = "Supplements"
ITEM.description = "A canister of a white slush that has no flavor."
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.category = "Food"
ITEM.functions.Slurp = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/mud1.wav",
	OnRun = function(item)
		item.player:addHunger(8000)
		item.player:addThirst(8000)
	end
}