local NotificationTypes = {
    ['success'] = 'success',
    ['error'] = 'error',
    ['info'] = 'inform',
    ['warning'] = 'warning',
}

Notification = {
    Notification = function(source, title, type, message, position, colour, iconClass)
        local notitype = nil
        if lib.table.contains({'success', 'error', 'info', 'warning'}, type) then
            notitype = NotificationTypes[type]
        else
            notitype = 'inform'
        end
        if IsDuplicityVersion() then
            TriggerClientEvent("qtm-lib:client:notification", source, notitype, message, position, colour, iconClass)
        else
            SendNUIMessage({
                type = "notification",
                message = message,
                notificationType = notitype,
                position = position,
                backgroundColor = colour,
                iconClass = iconClass
            })
        end
    end
}

return Notification