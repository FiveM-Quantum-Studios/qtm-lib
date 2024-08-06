local NotificationTypes = {
    ['success'] = 'success',
    ['error'] = 'error',
    ['info'] = 'inform',
    ['warning'] = 'warning',
}

Notification = {
    Notification = function(source, title, type, message)
        local notitype = nil
        if lib.table.contains({'success', 'error', 'info', 'warning'}, type) then
            notitype = NotificationTypes[type]
        else
            notitype = 'inform'
        end
        if IsDuplicityVersion() then -- serverside
            TriggerClientEvent('ox_lib:notify', source, {
                title = title,
                description = message,
                type = notitype,
                duration = Config.NotificationsTime
            })
        else -- clientside
            lib.notify({
                title = title,
                description = message,
                type = notitype,
                duration = Config.NotificationsTime
            })
        end
    end
}

return Notification