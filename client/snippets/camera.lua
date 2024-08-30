

Camera = {

	Create = function(x, y, z, rotX, rotY, rotZ, fov, type)
        local camera = CreateCamWithParams(type or "DEFAULT_SCRIPTED_CAMERA", x, y, z, rotX, rotY, rotZ, fov, false, 2)
        local currentlyFacingCoords
        return camera, currentlyFacingCoords
    end,
	SetActive = function(camera, active, interpTimeOrFalse)
		if not interpTimeOrFalse then
			interpTimeOrFalse = false
		end

		SetCamActive(camera, active)

		RenderScriptCams(active, interpTimeOrFalse and true, interpTimeOrFalse or -1, true, true)
	end,
	SetCoords = function(camera, x, y, z)
		SetCamCoord(camera, x, y, z)
	end,
	SetRot = function(camera, rotX, rotY, rotZ)
		SetCamRot(camera, rotX, rotY, rotZ, 2)
	end,
	GetRot = function(camera)
		return GetCamRot(camera, 2)
	end,
	GetCoords = function(camera)
		return GetCamCoord(camera)
	end,
	IsActive = function(camera)
		return IsCamActive(camera)
	end,
	Delete = function(camera, dontStopRenderingScriptCams)
		SetCamActive(camera, false)
		if not dontStopRenderingScriptCams then
			RenderScriptCams(false, false, -1, true, true)
		end
		DestroyCam(camera, false)
	end,
	GetOffsetFromCamera = function(camera, offsetVec)
		local camRight, camForward, camUp, camPosition = GetCamMatrix(camera)
		local camX, camY, camZ = table.unpack(camPosition)
		local offsetX, offsetY, offsetZ = table.unpack(offsetVec)

		-- Calculate the final position by applying the offset
		local finalX = camX + camRight.x * offsetX + camForward.x * offsetY + camUp.x * offsetZ
		local finalY = camY + camRight.y * offsetX + camForward.y * offsetY + camUp.y * offsetZ
		local finalZ = camZ + camRight.z * offsetX + camForward.z * offsetY + camUp.z * offsetZ

		return vec(finalX, finalY, finalZ)
	end,
	SetCamUseShallowDepthOfField = function(camera)
		SetCamUseShallowDofMode(camera, true)
	end,
	SetCamNearDof = function(camera, val)
		SetCamNearDof(camera, val or 0.7)
	end,
	SetCamFarDof = function(camera, val)
		SetCamFarDof(camera, val or 1.3)
	end,
	SetCamDofStrength = function(camera, val)
		SetCamDofStrength(camera, val or 1.0)
	end,
	SetUseHighDof = function()
		SetUseHiDof()
	end,
	FaceEntity = function(camera, entity, offsetX, offsetY, offsetZ)
		PointCamAtEntity(camera, entity, offsetX or 0.0, offsetY or 0.0, offsetZ or 0.0, true)
	end,
	FaceCoords = function(camera, targetX, targetY, targetZ)
		PointCamAtCoord(camera, targetX, targetY, targetZ)
	end,
	SmoothSetCoords = function(camera, x, y, z, time)
		if not time then time = 200 end

		local vec = GetCamCoord(camera)
		local startX, startY, startZ = table.unpack(vec)
		local startTime = GetGameTimer()

		Citizen.CreateThread(function()
			local complete = false

			while not complete do
				local currentTime = GetGameTimer()
				local elapsedTime = currentTime - startTime
				local t = elapsedTime / time

				if t >= 1.0 then
					t = 1.0
					complete = true
				end
				t = t * t * (3 - 2 * t)

				local newX = startX + (x - startX) * t
				local newY = startY + (y - startY) * t
				local newZ = startZ + (z - startZ) * t

				SetCamCoord(camera, newX, newY, newZ)

				Wait(0)
			end
		end)
	end,
    InterpBetween = function(cam1, cam2, time)
        SetCamActiveWithInterp(cam2.camera, cam1.camera, time, 1, 1)
    end,
	SmoothFaceCoords = function(camera, x, y, z, time)
		if not currentlyFacingCoords then
			currentlyFacingCoords = vec(x, y, z)
			PointCamAtCoord(camera, x, y, z)
			return
		end

		if not time then time = 200 end

		local startX, startY, startZ = table.unpack(currentlyFacingCoords)
		local startTime = GetGameTimer()

		Citizen.CreateThread(function()
			local complete = false

			while not complete do
				local currentTime = GetGameTimer()
				local elapsedTime = currentTime - startTime
				local t = elapsedTime / time

				if t >= 1.0 then
					t = 1.0
					complete = true
				end

				t = t * t * (3 - 2 * t)

				local newX = startX + (x - startX) * t
				local newY = startY + (y - startY) * t
				local newZ = startZ + (z - startZ) * t

				PointCamAtCoord(camera, newX, newY, newZ)

				Wait(0)
			end
		end)
	end
}

return Camera