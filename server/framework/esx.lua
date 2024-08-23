local ESX = exports['es_extended']:getSharedObject()

Framework = {
    ---comment: Get player identifier
    ---@param source string
    ---@return string | nil
    GetIdentifier = function(source)
        local player = ESX.GetPlayerFromId(source)
        if not player then return end
        return player.getIdentifier()
    end,
    GetPlayerFromId = function(source)
        return ESX.GetPlayerFromId(source)
    end,
    ---comment: Get player id from identifier
    ---@param identifier string
    ---@return number | false
    GetIdentifierID = function(identifier)
        local player = ESX.GetPlayerFromIdentifier(identifier)
        if not player then return false end
        return player.playerId
    end,
    ---comment: Get player character
    ---@param source string
    ---@return table | nil
    GetChar = function(source)
        local player = ESX.GetPlayerFromId(source)
        if not player then return end
        return {
            firstname = player.get('firstName'),
            lastname = player.get('lastName'),
            fullname = player.getName(),
            gender = player.get('sex'),
            dateofbirth = player.get('dateofbirth'),
        }
    end,
    ---comment: Get all players
    ---@return table
    GetPlayers = function()
        return ESX.GetPlayers()
    end,
    ---@param source string
    ---@return table | nil
    GetJob = function(source)
        local player = ESX.GetPlayerFromId(source)
        if not player then return end
        return {
            name = player.getJob().name,
            label = player.getJob().label,
            grade_label = player.getJob().grade_label,
            grade_level = player.getJob().grade_level,
            grade_payment = player.getJob().grade_salary
        }
    end,
    ---comment: Check if job exists
    ---@param jobName string
    ---@return boolean | nil
    DoesJobExist = function(jobName)
        local jobTable = ESX.GetJobs()
        if not jobTable then return end
        if lib.table.contains(jobTable, jobName) then
            return true
        else
            return false
        end
    end,
    ---comment: Get players online of job table
    ---@param jobs table
    ---@return number
    GetJobOnlineMembers = function(jobs)
        local count = 0
        for id, _ in pairs(ESX.GetPlayers()) do
            local player = ESX.GetPlayerFromId(id)
            if player then
                for _, job in pairs(jobs) do
                    if player.getJob().name == job then
                        count = count + 1
                    end
                end
            end
        end
        return count
    end,
    ---comment: Get player position
    ---@param source string
    ---@return vector3 | nil
    GetPosition = function(source)
        local player = ESX.GetPlayerFromId(source)
        if not player then return end
        return player.getCoords(true)
    end,
    ---comment: Get player bank amount
    ---@param source string
    ---@return number | nil
    GetBank = function(source)
        local player = ESX.GetPlayerFromId(source)
        if not player then return end
        return player.getAccount('bank').money
    end,
    ---comment: Get if player has group
    ---@param source string
    ---@param group string
    ---@return boolean | nil
    HasGroup = function(source, group)
        local player = ESX.GetPlayerFromId(source)
        if not player then return end
        return player.getGroup() == group
    end,
}

RegisterNetEvent('esx:playerDropped', function(playerId, reason)
    TriggerClientEvent('qtm:onPlayerLogout', playerId)
end)

return Framework