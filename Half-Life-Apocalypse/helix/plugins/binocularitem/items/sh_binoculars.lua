
ITEM.name = "Binoculars"
ITEM.model = Model("models/props_junk/cardboard_box004a.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A box containing binoculars."
ITEM.category = "Tools"

ITEM:Hook("drop", function(item)
	item.player:CanSetZoom(false)
end)
