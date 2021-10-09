ITEM.name = "Coffee"
ITEM.description = "A large Union-branded cylinder that contains Coffee."
ITEM.model = "models/bioshockinfinite/xoffee_mug_closed.mdl"
ITEM.category = "Drink"
ITEM.functions.Drink = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/barnacle_gulp2.wav",
	OnRun = function(item)
		item.player:addThirst(9000)
	end
}