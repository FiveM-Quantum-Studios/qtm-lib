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
    end,
    ---@return table | nil
    GetJob = function()
        local playerData = QBCore.Functions.GetPlayerData()
        if not playerData then return end

        local job = playerData.job
        return {
            name = job.name,
            label = job.label,
            grade_label = job.grade.name,
            grade_level = job.grade.level,
        }
    end,
    ---comment: Check if player has job
    ---@param jobNames string | table
    ---@return boolean
    HasPlayerJob = function(jobNames)
        local playerData = QBCore.Functions.GetPlayerData()

        if type(jobNames) == "table" then
            for _, jobName in pairs(jobNames) do
                if playerData.job.name == jobName then
                    return true
                end
            end
        else
            return playerData.job.name == jobNames
        end

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
        return lib..callback.await('qtm-lib:GetChar', false, targetId)
    end,
    ---comment: Get char details from identifier
    ---@param identifier string
    ---@return table
    GetIdenfierChar = function(identifier)
        return lib.callback.await('qtm-lib:GetChar2', false, identifier)
    end,

    

    ---comment: Resets player hunger and thirst
    HealStatus = function()
        local playerData = QBCore.Functions.GetPlayerData()

        TriggerServerEvent('consumables:server:addHunger', playerData.metadata.hunger + 100000)
        TriggerServerEvent('consumables:server:addThirst', playerData.metadata.hunger + 100000)
    end
}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Framework.PlayerLoaded = true
    TriggerEvent('qtm:onPlayerLoaded')
end)

RegisterNetEvent('qbx_core:client:playerLoggedOut', function()
    Framework.PlayerLoaded = false
    TriggerEvent('qtm:onPlayerLogout')
end)

return Framework