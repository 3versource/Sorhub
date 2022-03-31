
ITEM.name = "foodBase"
ITEM.description = "Food Base"
ITEM.model = "models/error.mdl"
ITEM.category = "Food"

ITEM.restFood = 1
ITEM.sound = "physics/flesh/flesh_squishy_impact_hard4.wav"

ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	OnRun = function(item)
        -- lowercase "item" in variable calls
		item.player:addHunger(item.restFood)
		item.player:EmitSound(item.sound)
	end
}
