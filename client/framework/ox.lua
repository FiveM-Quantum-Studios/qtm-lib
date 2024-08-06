Framework = {
    ---comment: Get if player is loaded
    --- @type boolean
    PlayerLoaded = player ~= nil,
    ---comment: Spawn vehicle
    ---@param model string
    ---@param pos vector3
    ---@param heading number
    ---@param cb any
    ---@param networked boolean
    SpawnVehicle = function(model, pos, heading, cb, networked)
        local result = lib.callback.await('qtm-lib:SpawnVehicle', false, model, pos, heading)
        cb(NetToVeh(result))
    end
}

RegisterNetEvent('ox:playerLoaded', function()
    Framework.PlayerLoaded = true
end)

RegisterNetEvent('ox:playerLogout', function()
    Framework.PlayerLoaded = false
end)

return Framework