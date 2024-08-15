Dispatch = {
    CreateDispatch = function(table)
        local playerData = exports['rcore_dispatch']:GetPlayerData()
        local data = {
            code = '10-64', -- string -> The alert code, can be for example '10-64' or a little bit longer sentence like '10-64 - Shop robbery'
            default_priority = 'low', -- 'low' | 'medium' | 'high' -> The alert priority
            coords = playerData.coords, -- vector3 -> The coords of the alert
            job = Config.PoliceJobs, -- string | table -> The job, for example 'police' or a table {'police', 'ambulance'}
            text = table.text, -- string -> The alert text
            type = 'alerts', -- alerts | shop_robbery | car_robbery | bank_robbery -> The alert type to track stats
            blip_time = 5, -- number (optional) -> The time until the blip fades
            image = '', -- string (optional) -> The url to show an image
            custom_sound = '', -- string (optional) -> The url to the sound to play with the alert
            blip = { -- Blip table (optional)
                sprite = table.sprite,
                colour = table.colour,
                scale = table.scale,
                text = Config.Language.blipText,
                flashes = table.flashes, 
                radius = table.radius
            }
        }
        TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
    end,
}
return Dispatch