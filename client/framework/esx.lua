local ESX = exports['es_extended']:getSharedObject()

Framework = {
    ---comment: Get if player is loaded
    --- @type boolean
    PlayerLoaded = ESX.IsPlayerLoaded(),
    ---comment: Spawn vehicle
    ---@param model string
    ---@param pos vector3
    ---@param heading number
    ---@param cb any
    ---@param networked boolean
    SpawnVehicle = function(model, pos, heading, cb, networked)
        ESX.Game.SpawnVehicle(model, pos, heading, cb, networked)
    end
}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function()
    Framework.PlayerLoaded = true
end)

return Framework
