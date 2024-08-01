Framework = {
    ---comment: Get if player is loaded
    --- @type boolean
    PlayerLoaded = exports.qbx_core:GetPlayerData() ~= nil,
    Callbacks = {
        Trigger = function(name, ...)
            return lib.callback.await(name, false, ...)
        end,
        TriggerAsync = function(name, cb, ...)
            cb(lib.callback.await(name, false, ...))
        end
    },
    ---comment: Spawn vehicle
    ---@param model string
    ---@param pos vector3
    ---@param heading number
    ---@param cb any
    ---@param networked boolean
    SpawnVehicle = function(model, pos, heading, cb, networked)
        local result = lib.callback.await('qtm-lib:SpawnVehicle', false, model, pos)
        cb(NetToVeh(result))
    end
}

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    Framework.PlayerLoaded = true
end)

RegisterNetEvent('qbx_core:client:playerLoggedOut', function()
    Framework.PlayerLoaded = false
end)

return Framework