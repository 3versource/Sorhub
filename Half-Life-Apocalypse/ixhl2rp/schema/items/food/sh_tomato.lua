ITEM.name = "Tomato"
ITEM.description = "A tomato! Americans used to look like this, you know. Red and round."
ITEM.model = "models/foodnhouseholditems/tomato.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(2000)
		item.player:addThirst(8000)
	end
}