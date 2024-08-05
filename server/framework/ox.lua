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
    GetChar = {
        ---comment: Get player first name
        ---@param source string
        ---@return string | nil
        firstname = function(source)
            local player = Ox.GetPlayer(source)
            if not player then return end
            return player.firstName
        end,
        ---comment: Get player last name
        ---@param source string
        ---@return string | nil
        lastname = function(source)
            local player = Ox.GetPlayer(source)
            if not player then return end
            return player.lastName
        end,
        ---comment: Get player full name
        ---@param source string
        ---@return string | nil
        fullname = function(source)
            local player = Ox.GetPlayer(source)
            if not player then return end
            return player.name
        end,
        ---comment: Get player gender
        ---@param source string
        ---@return string | nil
        gender = function(source)
            local player = Ox.GetPlayer(source)
            if not player then return end
            return player.gender --Dont know if it works
        end,
        ---comment: Get player date of birth
        ---@param source string
        ---@return string | nil
        dateofbirth = function(source)
            local player = Ox.GetPlayer(source)
            if not player then return end
            return player.dateofbirth --Dont know if it works
        end,
        ---comment: Get player phone number
        ---@param source string
        ---@return number | nil
        phone = function(source)
            local player = Ox.GetPlayer(source)
            if not player then return end
            return 0 --Dont know if it works
        end
    },
    GetJob = {
        ---comment: Get player job name
        ---@param source string
        ---@return string | nil
        name = function(source)
            local player = Ox.GetPlayer(source)
            if not player then return end
            return ''
        end,
        ---comment: Get player job label
        ---@param source string
        ---@return string | nil
        label = function (source)
            local player = Ox.GetPlayer(source)
            if not player then return end
            return ''
        end,
        grade = {
            ---comment: Get player job grade label
            ---@param source string
            ---@return string | nil
            label = function(source)
                local player = Ox.GetPlayer(source)
                if not player then return end
                return ''
            end,
            ---comment: Get player job grade level
            ---@param source string
            ---@return string | nil
            level = function(source)
                local player = Ox.GetPlayer(source)
                if not player then return end
                return ''
            end,
            ---comment: Get player job grade salary
            ---@param source string
            ---@return string | nil
            payment = function(source)
                local player = Ox.GetPlayer(source)
                if not player then return end
                return ''
            end
        }
    },
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










    lib.callback.register('qtm-lib:SpawnVehicle', function(source, model, pos, heading)
        local player = Ox.GetPlayer(source)
        if not player then return end
        return Ox.CreateVehicle({ model = model, owner = source.charid }, pos, heading)
    end)
}

return Framework