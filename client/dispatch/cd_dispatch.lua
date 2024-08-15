Dispatch = {
    CreateDispatch = function(table)
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {Config.PoliceJobs}, 
            coords = data.coords,
            title = Config.Language.methProduction,
            message = 'A '..data.sex..Config.Language.methProduction..' at '..data.street, 
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = table.sprite,
                scale = table.scale,
                colour = table.colour,
                flashes = table.flashes, 
                text = Config.Language.blipText,
                time = table.time,
                radius = table.radius
            }
        })
    end,
}
return Dispatch