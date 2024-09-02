Utils = {
	FindGround = function(table, bool, coords) -- GetGroundZFor_3dCoord does not have a big radius as the collissions need to be loaded, use bool to determine if we need to request collission 
		while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
            qtm.Logging('debug', 'Waiting until collisions have been loaded')
            Wait(500)
        end
		if bool then
			RequestCollisionAtCoord(coords.x, coords.y, coords.z)
			RequestAdditionalCollisionAtCoord(coords.x, coords.y, coords.z)
			Wait(1000)
		end
		local sortedCoords = {}
		for i, point in ipairs(table) do
			local onGround, newZ = GetGroundZFor_3dCoord(point.x, point.y, point.z, false)
			if not onGround then
				local z = point.z
				repeat
					z = z + 1
					onGround, newZ = GetGroundZFor_3dCoord(point.x, point.y, z, false)
				until onGround or z > 700
				if z > 700 then
					qtm.Logging('debug', 'Failed to find Z for:', point)
				end
			end
			sortedCoords[#sortedCoords + 1] = vector3(point.x, point.y, newZ)
		end
		return sortedCoords
	end,
}

return Utils