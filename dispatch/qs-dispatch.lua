Dispatch = {
    CreateDispatch = function(table)
        local playerData = exports['qs-dispatch']:GetPlayerInfo()
        TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
            job = {Config.PoliceJobs},
            callLocation = playerData.coords,
            callCode = { code = 'Cooking', snippet = 'Vehicle' }, -- Change this yourself
            message = table.text,
            flashes = table.flashes,
            image = nil,
            blip = {
                sprite = table.sprite,
                scale = table.scale,
                colour = table.colour,
                flashes = table.flashes,
                text = table.blipText,
                time = table.time,     --20 secs
            }
        })
    end,
}
return Dispatch