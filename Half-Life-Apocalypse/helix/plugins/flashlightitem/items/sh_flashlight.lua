
ITEM.name = "Flashlight"
ITEM.model = Model("models/jq/hlvr/characters/combine/combine_captain/torch/captain_torch_hlvr.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A box containing a flashlight."
ITEM.category = "Tools"

ITEM:Hook("drop", function(item)
	item.player:Flashlight(false)
end)
