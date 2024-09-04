Framework = {
    ---comment: Get player identifier
    ---@param source string
    ---@return string | nil
    GetIdentifier = function(source)
        local player = Ox.GetPlayer(source)
        if not player then return end
        return player.userId
    end,
    ---comment: Get player id from identifier
    ---@param identifier string
    ---@return number | false
    GetIdentifierID = function(identifier)
        local player = Ox.GetPlayerByFilter({userId = identifier})
        if not player then return false end
        return player.source
    end,
    ---comment: Get player character
    ---@param source string
    ---@return table | nil
    GetChar = function(source)
        local player = Ox.GetPlayer(source)
        if not player then return end
        return {
            firstname = player.firstname,
            lastname = player.lastname,
            fullname = player.name,
            gender = player.gender,
            dateofbirth = player.dateofbirth,
        }
    end,
    ---comment: Get all players
    ---@return table
    GetPlayers = function()
        return Ox.GetPlayers({})
    end,
    ---@param source string
    ---@return table | nil
    GetJob = function(source)
        local player = Ox.GetPlayer(source)
        if not player then return end
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
        local group = Ox.GetGroup(jobName)
        if group then return true end
        return false
    end,
    ---comment: Get players online of job table
    ---@param jobs table
    ---@return number
    GetJobOnlineMembers = function(jobs)
        local players = Ox.GetPlayers({ groups = jobs })
        if not players then return 0 end

        return #players
    end,
    ---comment: Get player position
    ---@param source string
    ---@return vector3 | nil
    GetPosition = function(source)
        local player = Ox.GetPlayer(source)
        if not player then return end
        return player.getCoords(true)
    end,
    ---comment: Get player bank amount
    ---@param source string
    ---@return number | nil
    GetBank = function(source)
        local player = Ox.GetPlayer(source)
        if not player then return end
        return player.get('accounts')['bank']
    end,
    ---comment: Get if player has group
    ---@param source string
    ---@param group string
    ---@return boolean | nil
    HasGroup = function(source, group)
        local player = Ox.GetPlayer(source)
        if not player then return end
        return player.getGroup() == group
    end,
    ---comment: Spawn vehicle
    ---@param source string
    ---@param model string
    ---@param pos vector3
    ---@param heading number
    ---@return number | nil
    lib.callback.register('qtm-lib:SpawnVehicle', function(source, model, pos, heading)
        local player = Ox.GetPlayer(source)
        if not player then return end
        return Ox.CreateVehicle({ model = model, owner = player.charid }, pos, heading)
    end)
}
return Framework