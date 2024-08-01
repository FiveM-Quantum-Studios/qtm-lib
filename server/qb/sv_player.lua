
if GetResourceState('qb_core') ~= 'started' then return end
QBCore = exports['qb-core']:GetCoreObject()
Framework = 'qb'

qtm = {}
qtm.Player = {}

function qtm.Player(source)
    local player, self = ESX.GetPlayerFromId(source), {}

    function self.GetJob()
        return {
            name = player.PlayerData.job.name or player.PlayerData.gang.name,
            label = player.PlayerData.job.label or player.PlayerData.gang.label,
    
            grade = {
                label = player.PlayerData.job.grade.name or player.PlayerData.gang.grade.name,
                level = player.PlayerData.job.grade.level or player.PlayerData.gang.grade.level,
                payment = player.PlayerData.job.payment or 0
            }
        }
    end

    function self.GetPosition()
        return player.PlayerData.position
    end

    function self.GetBank()
        return PlayerData.money['bank']
    end

    function self.GetChar()
        return {
            firstname = player.PlayerData.charinfo.firstname,
            lastname = player.PlayerData.charinfo.lastname,
            gender = player.PlayerData.charinfo.gender,
            dateofbirth = player.PlayerData.charinfo.birthdate,
            phone = player.PlayerData.charinfo.phone,
        }
    end

    function self.GetIdentifier()
        return player.PlayerData.license
    end



    -- Create an empty table with a metatable to access player methods
    local proxy = setmetatable({}, {
        __index = self
    })

    return proxy
end