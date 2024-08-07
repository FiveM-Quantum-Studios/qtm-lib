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
    ---@return number | false
    GetIdentifierID = function(identifier)
        local player = exports.qbx_core:GetPlayerByCitizenId(identifier)
        if not player then return false end
        return player.PlayerData.source
    end,
    ---comment: Get player character
    ---@param source string
    ---@return table | nil
    GetChar = function(source)
        local player = exports.qbx_core:GetPlayer(source)
        if not player then return end
        return {
            firstname = player.PlayerData.charinfo.firstname,
            lastname = player.PlayerData.charinfo.lastname,
            fullname = ("%s %s"):format(player.PlayerData.charinfo.firstname, player.PlayerData.charinfo.lastname),
            gender = player.PlayerData.charinfo.gender,
            dateofbirth = player.PlayerData.charinfo.birthdate,
        }
    end,
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