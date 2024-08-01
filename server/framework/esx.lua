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
    ---comment: Get player id from identifier
    ---@param identifier string
    ---@return number | false
    GetIdentifierID = function(identifier)
        local player = ESX.GetPlayerFromIdentifier(identifier)
        if not player then return false end
        return player.playerId
    end,
    GetChar = {
        ---comment: Get player first name
        ---@param source string
        ---@return string | nil
        firstname = function(source)
            local player = ESX.GetPlayerFromId(source)
            if not player then return end
            return player.get('firstName')
        end,
        ---comment: Get player last name
        ---@param source string
        ---@return string | nil
        lastname = function(source)
            local player = ESX.GetPlayerFromId(source)
            if not player then return end
            return player.get('lastName')
        end,
        ---comment: Get player full name
        ---@param source string
        ---@return string | nil
        fullname = function(source)
            local player = ESX.GetPlayerFromId(source)
            if not player then return end
            return player.getName()
        end,
        ---comment: Get player gender
        ---@param source string
        ---@return string | nil
        gender = function(source)
            local player = ESX.GetPlayerFromId(source)
            if not player then return end
            return player.get('sex')
        end,
        ---comment: Get player date of birth
        ---@param source string
        ---@return string | nil
        dateofbirth = function(source)
            local player = ESX.GetPlayerFromId(source)
            if not player then return end
            return player.get('dateofbirth')
        end,
        ---comment: Get player phone number
        ---@param source string
        ---@return number | nil
        phone = function(source)
            local player = ESX.GetPlayerFromId(source)
            if not player then return end
            return player.get('phone_number')
        end
    },
    GetJob = {
        ---comment: Get player job name
        ---@param source string
        ---@return string | nil
        name = function(source)
            local player = ESX.GetPlayerFromId(source)
            if not player then return end
            return player.getJob().name
        end,
        ---comment: Get player job label
        ---@param source string
        ---@return string | nil
        label = function (source)
            local player = ESX.GetPlayerFromId(source)
            if not player then return end
            return player.getJob().label
        end,
        grade = {
            ---comment: Get player job grade label
            ---@param source string
            ---@return string | nil
            label = function(source)
                local player = ESX.GetPlayerFromId(source)
                if not player then return end
                return player.getJob().grade_label
            end,
            ---comment: Get player job grade level
            ---@param source string
            ---@return string | nil
            level = function(source)
                local player = ESX.GetPlayerFromId(source)
                if not player then return end
                return player.getJob().grade
            end,
            ---comment: Get player job grade salary
            ---@param source string
            ---@return string | nil
            payment = function(source)
                local player = ESX.GetPlayerFromId(source)
                if not player then return end
                return player.getJob().grade_salary
            end
        }
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
    HasGroup = function(source, group)
        local player = ESX.GetPlayerFromId(source)
        if not player then return end
        return player.getGroup() == group
    end,
}
return Framework