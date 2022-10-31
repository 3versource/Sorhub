ITEM.name = "Better Outfits"
ITEM.description = "A not-so-trash outfit base without PAC support."
ITEM.base = "base_newoutfithandler"
ITEM.category = "Outfit"
ITEM.model = "models/Gibs/HGIBS.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.outfitCategories = {""}
/*
	citizen playermodel layout:
	skin - 0
	torso - 1
	legs - 2
	hands - 3
	headgear - 4
	bag - 5
	glasses - 6
	satchel - 7
	pouch - 8
	badge - 9
	headstrap - 10
	kevlar - 11
	facialhair - 12

	MPF playermodel layout:
*/


ITEM.playermodelBodygroupAndVariants = NULL -- table of pairs (bodygroup, variant), (bodygroup, variant)
-- so if index 1 = 1 and index 2 = 1, bodygroup type 1 will be set to variant 1
-- whatever the 1st bodygroup is of the model will have its variant changed to 1
ITEM.playermodelBodygroupChanges = 0
-- the amount of bodygroup changes an item will have (default = 0)

-- ITEM.playermodel = NULL
ITEM.isClothingItem = true
ITEM.isBagItem = false

ITEM.forModel = NULL
/*
	forModel must be one of the following:

	models/ug/new/citizens
	models/police
*/