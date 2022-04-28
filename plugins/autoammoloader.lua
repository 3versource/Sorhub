local PLUGIN = PLUGIN
PLUGIN.name = 'Auto Ammo Loader'
PLUGIN.author = 'OctraSource'
PLUGIN.description = 'Automatically loads ammo into your gun if you have the correct ammo for it.'
PLUGIN.links = { }

function PLUGIN:EntityFireBullets(entity)
    if entity:IsPlayer() then
-- if the entity is a player and fired a gun (because you can only fire a gun if you're alive)
        local weapon = entity:GetActiveWeapon() -- store their active weapon
        local ammo = game.GetAmmoName(weapon:GetPrimaryAmmoType()) -- store the ammo type of that weapon
        if weapon:Clip1() == 0 then -- if their clip is empty
            for k, v in pairs(entity:GetCharacter():GetInventory():GetItems()) do -- scan their inventory
                if v.isAmmo and v.ammo == ammoName then
-- if an item is an ammo item and its category is equal to the weapon's ammo name
                    entity:SetAmmo(v.ammoAmount + entity:GetAmmoCount(ammoName), ammoName) -- set the entity's ammo to that amount
                    v:Remove() -- remove that item
                    break -- break from the loop
                end
            end
        end
    end
end