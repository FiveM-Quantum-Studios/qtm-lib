local NotificationTypes = {
    ['success'] = 'success',
    ['error'] = 'error',
    ['info'] = 'info',
    ['warning'] = 'info',
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
            TriggerClientEvent('QBCore:Notify', source,  message, notitype, Config.NotificationsTime)
        else -- clientside
            TriggerEvent('QBCore:Notify', message, notitype, Config.NotificationsTime)
        end
    end
}

return Notification