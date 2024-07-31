
if GetResourceState('qb_core') ~= 'started' then return end
QBCore = exports['qb-core']:GetCoreObject()
Framework = 'qb'


qtm = {}
qtm.Player = {}


self = {}


function qtm.Player(source)
    local player = QBCore.Functions.GetPlayer(source)

    local self = {}

    self.job = {
        name = player.PlayerData.job.name or player.PlayerData.gang.name,
        label = player.PlayerData.job.label or player.PlayerData.gang.label,

        grade = {
            label = player.PlayerData.job.grade.name or player.PlayerData.gang.grade.name,
            level = player.PlayerData.job.grade.level or player.PlayerData.gang.grade.level,
            payment = player.PlayerData.job.payment or 0
        }
    }

    self.position = player.PlayerData.position







    return self
end