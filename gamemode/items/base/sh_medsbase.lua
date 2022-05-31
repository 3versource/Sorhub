ITEM.name = "medBase"
ITEM.description = "Medical base"
ITEM.category = "Medical"

ITEM.recovery = 1
ITEM.sound = "items/medshot4.wav"

ITEM.functions.Apply = {
	icon = "icon16/heart.png",
	OnRun = function(item)
		local ply = item.player
		local char = ply:GetCharacter()

        ply:EmitSound(item.sound)
		ply:SetHealth(math.min(ply:Health() + item.recovery + ((char:GetAttribute("medefficiency") or  0) * .5), 100, ply:GetMaxHealth()))
	end
}
