local ESX = exports['es_extended']:getSharedObject()

Framework = {
    ---comment: Get if player is loaded
    --- @type boolean
    PlayerLoaded = false, --Input here how player loaded is detexted
    ---comment: Spawn vehicle
    ---@param model string
    ---@param pos vector3
    ---@param heading number
    ---@param cb any
    ---@param networked boolean
    SpawnVehicle = function(model, pos, heading, cb, networked)
        -- Put Event here
    end
}

-- RegisterNetEvent('esx:playerLoaded', function()
--     Framework.PlayerLoaded = true
-- end)

return Framework