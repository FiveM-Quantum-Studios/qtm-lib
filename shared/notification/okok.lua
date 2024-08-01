local NotificationTypes = {
    ['success'] = 'success',
    ['error'] = 'error',
    ['info'] = 'info',
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
            TriggerClientEvent('okokNotify:Alert', source, title, message, Config.NotificationsTime, notitype, false)
        else -- clientside
            exports['okokNotify']:Alert(title, message, Config.NotificationsTime, notitype, false)
        end
    end
}

return Notification