ITEM.name = "Beans"
ITEM.description = "A dirty can of beans. You just got bean-boozled, look at you!"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "physics/flesh/flesh_squishy_impact_hard4.wav",
	OnRun = function(item)
		item.player:addHunger(15000)
		item.player:addThirst(4000)
	end
}