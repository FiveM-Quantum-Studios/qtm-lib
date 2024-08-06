QBCore = exports[Config.FrameworkResource]:GetCoreObject()

Framework = {
    ---comment: Get if player is loaded
    --- @type boolean
    PlayerLoaded = QBCore.Functions.GetPlayerData() ~= nil,
    ---comment: Spawn vehicle
    ---@param model string
    ---@param pos vector3
    ---@param heading number
    ---@param cb any
    ---@param networked boolean
    SpawnVehicle = function(model, pos, heading, cb, networked)
        QBCore.Functions.SpawnVehicle(model, cb, pos, networked)
    end
}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Framework.PlayerLoaded = true
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    Framework.PlayerLoaded = false
end)

return Framework