if GetResourceState('es_extended') ~= 'started' then return end
ESX = exports['es_extended']:getSharedObject()
Framework = 'ESX'

qtm = {}

function qtm.GetPlayerFromId(source)
    local player, self = ESX.GetPlayerFromId(source), {}

    function self.GetJob()
        return {
            name = player.getJob().name,
            label = player.getJob().label,

            grade = {
                label = player.getJob().grade_label,
                level = player.getJob().grade,
                payment = player.getJob().grade_salary
            }
        }
    end

    function self.GetPosition()
        return player.getCoords(true)
    end

    function self.GetBank()
        return player.getAccount('bank').money
    end

    function self.GetChar()
        local firstname, lastname = player.getName():match("([^%s]+) ([^%s]+)")
        return {
            firstname = firstname,
            lastname = lastname,
            gender = player.get('sex'),
            dateofbirth = player.get('dateofbirth'),
            phone = player.get('phone_number'),
        }
    end

    function self.GetIdentifier()
        return player.getIdentifier()
    end



    -- Create an empty table with a metatable to access player methods
    local proxy = setmetatable({}, {
        __index = self
    })

    return proxy
end

exports('getSharedObject', function()
    return qtm
end)
























RegisterCommand('Testt', function(source)
    qtm2 = exports['qtm-core']:getSharedObject()
    print(ESX.DumpTable(qtm2.GetPlayerFromId(source).GetChar().dateofbirth))
    --print(qtm.GetPlayerFromId(source).GetChar().dateofbirth)
end, false)