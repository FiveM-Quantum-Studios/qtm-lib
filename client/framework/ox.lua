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
    ---comment: Get job online members
    ---@param jobs table 
    GetJobOnlineMembers = function(jobs)
        return lib.callback.await('qtm-lib:GetJobOnlineMembers', false, jobs)
    end,
    ---comment: Get player ids in area
    ---@param pos vector3
    ---@param radius number
    ---@return table | nil
    GetPlayerIdsInArea = function(pos, radius)
        local players = GetActivePlayers()
        local playerTable = {}
    
        for _, player in ipairs(players) do
            local ped = GetPlayerPed(player)
            local playerCoords = GetEntityCoords(ped)
            if #(pos - playerCoords) <= radius then
                playerTable[#playerTable+1] = GetPlayerServerId(player)
            end
        end
        
        if #playerTable == 0 then
            return nil
        else
            return playerTable
        end
    end,
    ---comment: Get char details from source
    ---@param targetId string
    ---@return table
    GetSourceChar = function(targetId)
        return ox_lib.callback.await('qtm-lib:GetChar', false, targetId)
    end,
    ---comment: Get char details from identifier
    ---@param identifier string
    ---@return table
    GetIdenfierChar = function(identifier)
        return lib.callback.await('qtm-lib:GetChar2', false, identifier)
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