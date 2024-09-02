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

	DrawText3D = function(data)
		local function GetLineCountAndMaxLength(text)
			local count = 0
			local maxLength = 0
			for line in text:gmatch("([^\n]*)\n?") do
				count = count + 1
				local length = #line
				if length > maxLength then
					maxLength = length
				end
			end
			return count, maxLength
		end
		SetTextScale(0.30, 0.30)
		SetTextFont(0)
		SetTextProportional(true)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(true)
		local totalLength = #data.text
		local textMaxLength = data.textMaxLength or 99
		local text = data.text:sub(1, math.min(totalLength, textMaxLength))
		AddTextComponentString(text)
		SetDrawOrigin(data.coords.x, data.coords.y, data.coords.z, 0)
		DrawText(0.0, 0.0)
		local lineCount, maxLength = GetLineCountAndMaxLength(text)
		local padding = 0.005
		local heightFactor = (lineCount / 43) + padding
		local widthFactor = (maxLength / 100) + padding
	
		local height = (heightFactor / 2) - (padding / 2)
		local width = (widthFactor / 2) - (padding / 2)
		DrawRect(0.0, height, width, heightFactor, 0, 0, 0, 150)
		ClearDrawOrigin()
	end
}

return Utils