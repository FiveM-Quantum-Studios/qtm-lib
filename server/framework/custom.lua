Framework = {
    ---comment: Get player identifier
    ---@param source string
    ---@return string | nil
    GetIdentifier = function(source)

        return ''
    end,
    GetPlayerFromId = function(source)
        return ESX.GetPlayerFromId(source)
    end,
    ---comment: Get player id from identifier
    ---@param identifier string
    ---@return number | false
    GetIdentifierID = function(identifier)

        return 0
    end,
    ---comment: Get player character
    ---@param source string
    ---@return table | nil
    GetChar = function(source)
        return {
            firstname = '',
            lastname = '',
            fullname = '',
            gender = '',
            dateofbirth = '',
        }
    end,
    ---comment: Get all players
    ---@return table
    GetPlayers = function()
        return {}
    end,
    ---@param source string
    ---@return table | nil
    GetJob = function(source)

        return {
            name = '',
            label = '',
            grade_label = '',
            grade_level = '',
            grade_payment = ''
        }
    end,
    ---comment: Check if job exists
    ---@param jobName string
    ---@return boolean | nil
    DoesJobExist = function(jobName)

        return nil
    end,
    ---comment: Get players online of job table
    ---@param jobs table
    ---@return number
    GetJobOnlineMembers = function(jobs)
        local count = 0

        return count
    end,
    ---comment: Get player position
    ---@param source string
    ---@return vector3 | nil
    GetPosition = function(source)

        return nil
    end,
    ---comment: Get player bank amount
    ---@param source string
    ---@return number | nil
    GetBank = function(source)

        return nil
    end,
    ---comment: Get if player has group
    ---@param source string
    ---@param group string
    ---@return boolean | nil
    HasGroup = function(source, group)

        return nil
    end,
}

return Framework