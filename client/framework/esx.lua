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
    end,
    ---@return table | nil
    GetJob = function()
        local player = ESX.GetPlayerData()
        if not player then return end
        local job = player.job
        return {
            name = job.name,
            label = job.label,
            grade_label = job.grade_name,
            grade_level = job.grade,
        }
    end,
    ---comment: Check if player has job
    ---@param jobNames string | table
    ---@return boolean
    HasPlayerJob = function(jobNames)
        local playerData = ESX.GetPlayerData()

        if type(jobNames) == "table" then
            for _, jobName in pairs(jobNames) do
                if playerData.job.name == jobName then return true end
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
        local playerTable = {}
        local playersInArea = ESX.Game.GetPlayersInArea(pos, radius)

        if #playersInArea > 0 then
            for _, playerId in ipairs(playersInArea) do
                playerTable[#playerTable + 1] = GetPlayerServerId(playerId)
            end
        else
            return nil
        end

        return playerTable
    end,
    GetChar = function()
        return {
            firstname = ESX.PlayerData.firstName,
            lastname = ESX.PlayerData.firstName,
            fullname = ESX.PlayerData.name,
            gender = ESX.PlayerData.sex,
            dateofbirth = ESX.PlayerData.dateofbirth,
            identifier = ESX.PlayerData.identifier,
        }
    end,
    ---comment: Get char details from source
    ---@param targetId string
    ---@return table
    GetSourceChar = function(targetId)
        return lib.callback.await('qtm-lib:GetChar', false, targetId)
    end,
    ---comment: Get char details from identifier
    ---@param identifier string
    ---@return table
    GetIdenfierChar = function(identifier)
        return lib.callback.await('qtm-lib:GetChar2', false, identifier)
    end,


    ---comment: Resets player hunger and thirst
    HealStatus = function()
        TriggerEvent('esx_status:add', "hunger", 1000000)
        TriggerEvent('esx_status:add', "thirst", 1000000)
    end
}

RegisterNetEvent('esx:playerLoaded', function()
    Framework.PlayerLoaded = true
    TriggerEvent('qtm:onPlayerLoaded')
end)






return Framework