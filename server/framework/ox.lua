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
    ---@return string | false
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
    ---comment: Check if player has job
    ---@param source string
    ---@param jobNames string | table
    ---@return boolean | nil
    HasPlayerJob = function(source, jobNames)
        return false
    end,
    Society = {
        ---comment: Add money to society
        ---@param society string
        ---@param amount number
        AddMoney = function(society, amount)
            if not society or not GetInvokingResource() then return end
            --Dont know the ox_banking stuff
        end,
        ---comment: Remove money from society
        ---@param society string
        ---@param amount number
        RemoveMoney = function(society, amount)
            if not society or not GetInvokingResource() then return end
            --Dont know the ox_banking stuff
        end,
        ---comment: Get money from society
        ---@param society string
        ---@return number
        GetMoney = function(society)
            if not society or not GetInvokingResource() then return 0 end
            return 0 --Dont know the ox_banking stuff
        end
    },
    ---comment: Get players online of job table
    ---@param jobs table
    ---@return number
    GetJobOnlineMembers = function(jobs)
        local players = Ox.GetPlayers({ groups = jobs })
        if not players then return 0 end

        return #players
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
    ---comment: Get if player is dead
    ---@param source string
    ---@return integer | nil
    GetDeathStatus = function(source)
        local player = Ox.GetPlayer(source)
        if not player then return end
        
        return player.metadata.isDead
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