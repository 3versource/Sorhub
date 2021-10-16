PLUGIN.name = "Binocular item"
PLUGIN.author = "OctraSource"
PLUGIN.description = "Adds an item allowing players to zoom in."

function PLUGIN:SetCanZoom(client, bEnabled)
	local character = client:GetCharacter()
	local inventory = character and character:GetInventory()

	if (inventory and inventory:HasItem("binoculars")) then
		return true
	end
end