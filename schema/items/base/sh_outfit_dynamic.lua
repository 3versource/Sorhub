ITEM.name = "Better Outfits"
ITEM.description = "A not-so-trash outfit base without PAC support."
ITEM.base = "base_newoutfithandler"
ITEM.category = "Outfit"
ITEM.model = "models/Gibs/HGIBS.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.outfitCategory = "the clothing item's body selection"
-- currently: pants, torso, head, hands, eyes, mouth

ITEM.playermodelBodygroupAndVariants = NULL -- table of pairs (bodygroup, variant), (bodygroup, variant)
-- so if index 1 = 1 and index 2 = 1, bodygroup type 1 will be set to variant 1
-- whatever the 1st bodygroup is of the model will have its variant changed to 1
ITEM.playermodelBodygroupChanges = 1
-- the amount of bodygroup changes an item will have (default = 1)

-- ITEM.playermodel = NULL
-- ITEM.playermodelSkin = NULL -- the new skin the player will have
ITEM.isClothingItem = true
ITEM.isBagItem = false