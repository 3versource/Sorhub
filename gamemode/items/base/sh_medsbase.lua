ITEM.name = "medBase"
ITEM.description = "Medical base"
ITEM.category = "Medical"

ITEM.recovery = 1
ITEM.sound = "items/medshot4.wav"

ITEM.functions.Apply = {
	icon = "icon16/heart.png",
	OnRun = function(item)
		local client = item.player

        item.player:EmitSound(item.sound)
		client:SetHealth(math.min(client:Health() + item.recovery, 100, client:GetMaxHealth()))
	end
}
