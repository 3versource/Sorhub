ITEM.name = "waterBase"
ITEM.description = "Water Base"
ITEM.model = "models/error.mdl"
ITEM.category = "Drink"

-- restoration time (in seconds) && sound
ITEM.restThirst = 1
ITEM.sound = "npc/barnacle/barnacle_gulp2.wav"

ITEM.functions.Drink = {
	icon = "icon16/cup.png",
	OnRun = function(item)
		-- lowercase "item" in variable calls
		item.player:addThirst(item.restThirst)
		item.player:EmitSound(item.sound)
	end
}
