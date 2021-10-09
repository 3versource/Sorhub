ITEM.name = "Cookie Cylinder"
ITEM.description = "A cylinder rolled up to contain cookies. Did somebody steal your cookie-roll?"
ITEM.model = "models/foodnhouseholditems/cookies.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(9000)
	end
}