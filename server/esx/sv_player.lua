if GetResourceState('es_extended') ~= 'started' then return end
ESX = exports['es_extended']:getSharedObject()
Framework = 'esx'


qtm = {}
qtm.Player = {}


self = {}


function qtm.Player(source)
    local player = ESX.GetPlayerFromId(source)

    local self = {}

    self.job = {
        name = player.getJob().name,
        label = player.getJob().label,

        grade = {
            label = player.getJob().grade_label,
            level = player.getJob().grade,
            payment = player.getJob().grade_salary
        }
    }

    self.position = player.getCoords(true)







    return self
end


























function qtm.GetPlayerFromId(source)
    return qtm.Player[tonumber(source)]
end

function qtm.GetPlayerFromId2(source)
    xPlayer = ESX.GetPlayerFromId(source)
    return {        --identifier = xPlayer.identifier,
    accounts = xPlayer.getAccounts(),
    inventory = xPlayer.getInventory(),
    job = xPlayer.getJob(),
    loadout = xPlayer.getLoadout(),
    money = xPlayer.getMoney(),
    position = xPlayer.getCoords(true),
    metadata = xPlayer.getMeta(),}
end
RegisterCommand('Testt', function(source)
    print(ESX.DumpTable(qtm.GetPlayerFromId(source)))
end, false)

--[[
{
        --identifier = xPlayer.identifier,
        accounts = xPlayer.getAccounts(),
        money = xPlayer.getMoney(),
        position = xPlayer.getCoords(true),
        metadata = xPlayer.getMeta(),
    }







PlayerData.job -> Job table of the player
PlayerData.job.name -> Job name of the player (ex: Police)
PlayerData.job.label -> Label of the job (ex: Luitenant)
PlayerData.job.payment -> Job payment amount
PlayerData.job.onduty -> Duty status of the player
PlayerData.gang -> Gang table of the player
PlayerData.gang.name -> Gang name (ex: Ballas)
PlayerData.gang.label -> Gang label (ex: Boss)
PlayerData.position -> Current position of the player

PlayerData.money['cash'] -> Total cash on player
PlayerData.money['bank'] -> Total money on bank
PlayerData.charinfo -> Character info of player (table)
PlayerData.charinfo.firstname -> Firstname of the character
PlayerData.charinfo.lastname -> Lastname of the character
PlayerData.charinfo.birthdate -> BirthDate of the character
PlayerData.charinfo.gender -> Gender of character
PlayerData.charinfo.nationality -> Nationality of character
PlayerData.charinfo.phone -> Phone number of character
PlayerData.charinfo.account -> Bank account number of the character
]]