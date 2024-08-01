local NotificationTypes = {
    ['success'] = 'success',
    ['error'] = 'error',
    ['info'] = 'inform',
    ['warning'] = 'inform',
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
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = notitype, text = message})
        else -- clientside
            exports['mythic_notify'].DoCustomHudText(notitype, message, Config.NotificationsTime)
        end
    end
}

return Notification