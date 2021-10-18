
ITEM.base = "base_foodwater"
ITEM.name = "Food/Water Base"
ITEM.description = "- - - -"
ITEM.model = Model("models/props_c17/suitcase_passenger_physics.mdl")
ITEM.category = "Food/Drink"
ITEM.width = 1
ITEM.height = 1
ITEM.hungerRecov = 0
ITEM.thirstRecov = 0
ITEM.isFood = NULL

if(isFood == true) then
    ITEM.functions.Eat = {
        icon = "icon16/cake.png",
        sound = "physics/flesh/flesh_squishy_impact_hard4.wav",
        OnRun = function(item)
            item.player:addHunger(hungerRecov)
            item.player:addThirst(thirstRecov)
        end
    }
end
elseif(isFood == false) then
    ITEM.functions.Drink = {
        icon = "icon16/cup.png",
        sound = "npc/barnacle/barnacle_gulp2.wav",
        OnRun = function(item)
            item.player:addThirst(thirstRecov)
            item.player:addHunger(hungerRecov)
        end
    }
end