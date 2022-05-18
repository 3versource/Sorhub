ITEM.name = "Adrenaline Shot"
ITEM.model = Model("models/props_c17/TrapPropeller_Lever.mdl")
ITEM.description = "A syringe that is labelled on the side, 'Adrenaline.' A green fluid sloshes inside."
ITEM.category = "Medical"
ITEM.sound = "items/medshot4.wav"

ITEM.functions.Inject = {
	icon =  "icon16/lightning.png",
	OnRun = function(itemTable)
		local client = itemTable.player

		client:EmitSound(ITEM.sound)
		client:RestoreStamina(40)
		client:SetHealth(math.min(client:Health() - 5, client:GetMaxHealth()))
		if client:Health() <= 0 then
			client:TakeDamage(100)
		end
	end
}
