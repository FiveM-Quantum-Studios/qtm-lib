local ESX = exports['es_extended']:getSharedObject()

Framework = {
    ---comment: Get if player is loaded
    --- @type boolean
    PlayerLoaded = ESX.IsPlayerLoaded(),
    ---comment: Spawn vehicle
    ---@param model string
    ---@param pos vector3
    ---@param heading number
    ---@param cb any
    ---@param networked boolean
    SpawnVehicle = function(model, pos, heading, cb, networked)
        ESX.Game.SpawnVehicle(model, pos, heading, cb, networked)
    end,
    ---@return table | nil
    GetJob = function()
        local player = ESX.GetPlayerData()
        if not player then return end
        local job = player.job
        return {
            name = job.name,
            label = job.label,
            grade_label = job.grade_name,
            grade_level = job.grade,
        }
    end,
    ---comment: Check if player has job
    ---@param jobNames string | table
    ---@return boolean
    HasPlayerJob = function(jobNames)
        local playerData = ESX.GetPlayerData()

        if type(jobs) == "table" then
            for _, jobName in pairs(jobs) do
                if playerData.job.name == jobName then return true end
            end
        else
            return playerData.job.name == jobs
        end

        return false
    end,


    ---comment: Resets player hunger and thirst
    HealStatus = function()
        TriggerEvent('esx_status:add', "hunger", 1000000)
        TriggerEvent('esx_status:add', "thirst", 1000000)
    end
}

RegisterNetEvent('esx:playerLoaded', function()
    Framework.PlayerLoaded = true
    TriggerEvent('qtm:onPlayerLoaded')
end)






return Framework