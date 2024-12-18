Framework = {
    ---comment: Get player identifier
    ---@param source string
    ---@return string | nil
    GetIdentifier = function(source)
        local player = exports.qbx_core:GetPlayer(source)
        if not player then return end
        return player.PlayerData.citizenid
    end,
    ---comment: Get player id from identifier
    ---@param identifier string
    ---@return string | false
    GetIdentifierID = function(identifier)
        local player = exports.qbx_core:GetPlayerByCitizenId(identifier)
        if not player then return false end
        return player.PlayerData.source
    end,
    ---comment: Get player character
    ---@param source string
    ---@return table | nil
    GetChar = function(source)
        local player = exports.qbx_core:GetPlayer(source).PlayerData.charinfo
        if not player then return end
        return {
            firstname = player.firstname,
            lastname = player.lastname,
            fullname = ("%s %s"):format(player.firstname, player.lastname),
            gender = player.gender,
            dateofbirth = player.birthdate,
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
        return exports.qbx_core:GetQBPlayers()
    end,
    ---@param source string
    ---@return table | nil
    GetJob = function(source)
        local player = exports.qbx_core:GetPlayer(source)
        if not player then return end
        return {
            name = player.PlayerData.job.name,
            label = player.PlayerData.job.label,
            grade_label = player.PlayerData.job.grade.name,
            grade_level = player.PlayerData.job.grade.level,
            grade_payment = player.PlayerData.job.payment
        }
    end,
    ---comment: Check if job exists
    ---@param jobName string
    ---@return boolean | nil
    DoesJobExist = function(jobName)
        local jobTable = exports.qbx_core:GetJobs()
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
        local player = exports.qbx_core:GetPlayer(source)
        if not player then return end
    
        if type(jobNames) == "table" then
            for index, jobName in pairs(jobNames) do
                if player.PlayerData.job.name == jobName then return true end
            end
        else
            return player.PlayerData.job.name == jobNames
        end
    
        return false
    end,
    Society = {
        ---comment: Add money to society
        ---@param society string
        ---@param amount number
        AddMoney = function(society, amount)
            if not society or not GetInvokingResource() then return end
            exports['Renewed-Banking']:addAccountMoney(society, amount)
        end,
        ---comment: Remove money from society
        ---@param society string
        ---@param amount number
        RemoveMoney = function(society, amount)
            if not society or not GetInvokingResource() then return end
            exports['Renewed-Banking']:removeAccountMoney(society, amount)
        end,
        ---comment: Get money from society
        ---@param society string
        ---@return number
        GetMoney = function(society)
            if not society or not GetInvokingResource() then return 0 end
            return exports['Renewed-Banking']:getAccountMoney(society)
        end
    },
    ---comment: Get players online of job table
    ---@param jobs table
    ---@return number
    GetJobOnlineMembers = function(jobs)
        local count = 0

        for _, job in pairs(jobs) do
            count += exports.qbx_core:GetDutyCountJob(job)
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
        local player = exports.qbx_core:GetPlayer(source)
        if not player then return end
        return player.PlayerData.position
    end,
    ---comment: Get player bank amount
    ---@param source string
    ---@return number | nil
    GetBank = function(source)
        local player = exports.qbx_core:GetPlayer(source)
        if not player then return end
        return player.PlayerData.money['bank']
    end,
    ---comment: Get if player has group
    ---@param source string
    ---@param group string
    ---@return boolean | nil
    HasGroup = function(source, group)
        return exports.qbx_core:HasPermission(source, group)
    end,
    ---comment: Get if player is dead
    ---@param source string
    ---@return integer | nil
    GetDeathStatus = function(source)
        local Player = QBCore.Functions.GetPlayer(target)
        if not Player then return end
        
        return Player.PlayerData.metadata['isdead']
    end,
    ---comment: Spawn vehicle
    ---@param source string
    ---@param model string
    ---@param pos vector3
    ---@param heading number
    ---@return number | nil
    lib.callback.register('qtm-lib:SpawnVehicle', function(source, model, pos, heading)
        local netId, entity = qbx.spawnVehicle({ model = model, spawnSource = pos })
        return netId
    end)
}

return Framework