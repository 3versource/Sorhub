
ITEM.name = "Flashlight"
ITEM.model = Model("models/props_junk/cardboard_box004a.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A box containing a flashlight."
ITEM.category = "Tools"

ITEM:Hook("drop", function(item)
	item.player:Flashlight(false)
end)
