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
    ---@return string | false
    GetIdentifierID = function(identifier)
        local player = ESX.GetPlayerFromIdentifier(identifier)
        if not player then return false end
        return player.playerId
    end,
    ---comment: Get player character
    ---@param source string
    ---@return table | nil
    GetChar = function(source)
        local playerIdentifier = ESX.GetPlayerFromId(source)?.getIdentifier()

        local row = MySQL.single.await('SELECT `firstname`, `lastname`, `sex`, `dateofbirth` FROM `users` WHERE `identifier` = ? LIMIT 1', {
            playerIdentifier
        })
        if not row then return end
        return {
            firstname = row.firstname,
            lastname = row.lastname,
            fullname = string.format('%s %s', row.firstname, row.lastname),
            gender = row.sex,
            dateofbirth = row.dateofbirth,
        }
    end,
    ---comment: Callback to receive GetChar on client
    ---@param src string
    ---@param targetSource string
    ---@return table | nil
    lib.callback.register('qtm-lib:GetChar', function(src, targetSource)
        return Framework.GetChar(targetSource)
    end),
    ---comment: Callback to receive GetChar on client
    ---@param src string
    ---@param targetIdentifier string
    ---@return table | nil
    lib.callback.register('qtm-lib:GetChar', function(src, targetIdentifier)
        return Framework.GetChar(Framework.GetIdentifierID(targetIdentifier))
    end),
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
            grade_level = player.getJob().grade,
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
    ---comment: Check if player has job
    ---@param source string
    ---@param jobNames string | table
    ---@return boolean | nil
    HasPlayerJob = function(source, jobNames)
        local player = ESX.GetPlayerFromId(source)
        if not player then return end
        if type(jobNames) == "table" then
            for index, jobName in pairs(jobNames) do
                if player.job.name == jobName then return true end
            end
        else
            return player.job.name == jobNames
        end
    
        return false
    end,
    Society = {
        ---comment: Add money to society
        ---@param society string
        ---@param amount number
        AddMoney = function(society, amount)
            if not society or not GetInvokingResource() then return end
            TriggerEvent('esx_addonaccount:getSharedAccount', ('society_%s'):format(society), function(account)
                account.addMoney(amount)
            end)
        end,
        ---comment: Remove money from society
        ---@param society string
        ---@param amount number
        RemoveMoney = function(society, amount)
            if not society or not GetInvokingResource() then return end
            TriggerEvent('esx_addonaccount:getSharedAccount', ('society_%s'):format(society), function(account)
                account.removeMoney(amount)
            end)
        end,
        ---comment: Get money from society
        ---@param society string
        ---@return number
        GetMoney = function(society)
            if not society or not GetInvokingResource() then return 0 end
            TriggerEvent('esx_addonaccount:getSharedAccount', ('society_%s'):format(society), function(account)
                return account.money
                ---@diagnostic disable-next-line: missing-return
            end)
        end
    },
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
    ---comment: Get job online members
    ---@param source string
    ---@param jobs table
    ---@return number | nil
    lib.callback.register('qtm-lib:GetJobOnlineMembers', function(source, jobs)
        return Framework.GetJobOnlineMembers(jobs)
    end),
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
    ---comment: Get if player is dead
    ---@param source string
    ---@return integer | nil
    GetDeathStatus = function(source)
        local player = ESX.GetPlayerFromId(source)
        if not player then return end
    
        local isDead = MySQL.scalar.await('SELECT `is_dead` FROM `users` WHERE `identifier` = ? LIMIT 1', {
            player.identifier
        })
    
        return isDead
    end
}

RegisterNetEvent('esx:playerDropped', function(playerId, reason)
    TriggerClientEvent('qtm:onPlayerLogout', playerId)
end)

return Framework