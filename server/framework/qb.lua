local QBCore = exports['qb-core']:GetCoreObject()

Framework = {
    ---comment: Get player identifier
    ---@param source string
    ---@return string | nil
    GetIdentifier = function(source)
        local player = QBCore.Functions.GetPlayer(source)
        if not player then return end
        return player.PlayerData.citizenid
    end,
    ---comment: Get player id from identifier
    ---@param identifier string
    ---@return number | false
    GetIdentifierID = function(identifier)
        local player = QBCore.Functions.GetPlayerByCitizenId(identifier)
        if not player then return false end
        return player.PlayerData.source
    end,
    GetChar = {
        ---comment: Get player first name
        ---@param source string
        ---@return string | nil
        firstname = function(source)
            local player = QBCore.Functions.GetPlayer(source)
            if not player then return end
            return player.PlayerData.charinfo.firstname
        end,
        ---comment: Get player last name
        ---@param source string
        ---@return string | nil
        lastname = function(source)
            local player = QBCore.Functions.GetPlayer(source)
            if not player then return end
            return player.PlayerData.charinfo.lastname
        end,
        ---comment: Get player full name
        ---@param source string
        ---@return string | nil
        fullname = function(source)
            local player = QBCore.Functions.GetPlayer(source)
            if not player then return end
            return ("%s %s"):format(player.PlayerData.charinfo.firstname, player.PlayerData.charinfo.lastname)
        end,
        ---comment: Get player gender
        ---@param source string
        ---@return string | nil
        gender = function(source)
            local player = QBCore.Functions.GetPlayer(source)
            if not player then return end
            return player.PlayerData.charinfo.gender
        end,
        ---comment: Get player date of birth
        ---@param source string
        ---@return string | nil
        dateofbirth = function(source)
            local player = QBCore.Functions.GetPlayer(source)
            if not player then return end
            return player.PlayerData.charinfo.birthdate
        end,
        ---comment: Get player phone number
        ---@param source string
        ---@return number | nil
        phone = function(source)
            local player = QBCore.Functions.GetPlayer(source)
            if not player then return end
            return player.PlayerData.charinfo.phone
        end
    },
    GetJob = {
        ---comment: Get player job name
        ---@param source string
        ---@return string | nil
        name = function(source)
            local player = QBCore.Functions.GetPlayer(source)
            if not player then return end
            return player.PlayerData.job.name
        end,
        ---comment: Get player job label
        ---@param source string
        ---@return string | nil
        label = function (source)
            local player = QBCore.Functions.GetPlayer(source)
            if not player then return end
            return player.PlayerData.job.label
        end,
        grade = {
            ---comment: Get player job grade label
            ---@param source string
            ---@return string | nil
            label = function(source)
                local player = QBCore.Functions.GetPlayer(source)
                if not player then return end
                return player.PlayerData.job.grade.name
            end,
            ---comment: Get player job grade level
            ---@param source string
            ---@return string | nil
            level = function(source)
                local player = QBCore.Functions.GetPlayer(source)
                if not player then return end
                return player.PlayerData.job.grade.level
            end,
            ---comment: Get player job grade salary
            ---@param source string
            ---@return string | nil
            payment = function(source)
                local player = QBCore.Functions.GetPlayer(source)
                if not player then return end
                return player.PlayerData.job.payment
            end
        }
    },
    ---comment: Get players online of job table
    ---@param jobs table
    ---@return number
    GetJobOnlineMembers = function(jobs)
        local players = QBCore.Functions.GetPlayers()
        local count = 0

        for _, job in pairs(jobs) do
            for id, _ in pairs(players) do
                local player = QBCore.Functions.GetPlayer(id)
                if player then
                    if player.PlayerData.job.name == job then
                        if player.PlayerData.job.onduty then
                            count += 1
                        end
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
        local player = QBCore.Functions.GetPlayer(source)
        if not player then return end
        return player.PlayerData.position
    end,
    ---comment: Get player bank amount
    ---@param source string
    ---@return number | nil
    GetBank = function(source)
        local player = QBCore.Functions.GetPlayer(source)
        if not player then return end
        return player.PlayerData.money['bank']
    end,
    ---comment: Get if player has group
    ---@param source string
    ---@param group string
    ---@return boolean | nil
    HasGroup = function(source, group)
        return QBCore.Functions.HasPermission(source, group)
    end,
}
return Framework