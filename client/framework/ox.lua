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
    end,
    ---@return table | nil
    GetJob = function()

        if not player then return end

        return {
            name = nil,
            label = nil,
            grade_label = nil,
            grade_level = nil,
        }
    end,
    ---comment: Check if player has job
    ---@param jobNames string | table
    ---@return boolean
    HasPlayerJob = function(jobNames)
        return false
    end,


    ---comment: Resets player hunger and thirst
    HealStatus = function()

    end
}

RegisterNetEvent('ox:playerLoaded', function()
    Framework.PlayerLoaded = true
    TriggerEvent('qtm:onPlayerLoaded')
end)

RegisterNetEvent('ox:playerLogout', function()
    Framework.PlayerLoaded = false
    TriggerEvent('qtm:onPlayerLogout')
end)

return Framework