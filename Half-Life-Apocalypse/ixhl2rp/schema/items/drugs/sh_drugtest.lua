
ITEM.name = "drugtest"
ITEM.model = Model("models/props_wasteland/prison_toiletchunk01f.mdl")
ITEM.description = "drugtest item"
ITEM.category = "Drug"

function isDrugged()
	if drugged==true then
		local client = itemTable.player
		client:DrawMaterialOverlay("models/props_lab/warp_sheet", 1)
	end
end


ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	icon = "icon16/heart.png",
	OnRun = function(itemTable)
		local client = itemTable.player
		drugged = true
		isDrugged()
	end
}
