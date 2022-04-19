
local PLUGIN = PLUGIN

PLUGIN.name = "Auto Ammo Loader"
PLUGIN.author = "OctraSource"
PLUGIN.description = "Automatically loads guns into stash if the magazine is empty and they have the item."


if (CLIENT) then

	-- right now, this checks every player in the server and checks if their alive. if they are, print and store two variables

	for i, ply in ipairs( player.GetAll() ) do
		if ply:Alive() then -- if the player selected is alive,
			local weapon = ply:GetActiveWeapon() -- store their weapon and that weapon's ammo type
			local ammoType = weapon:GetPrimaryAmmoType() -- this returns an integer (ID of the ammo type)

			-- if -1 is printed, then the weapon has no ammo type
			print(ammoType)

			if (ply.GetAmmoCount(ammoType) == 0 and ammoType ~= -1) then
				print("e")
			end

		end
	end
end