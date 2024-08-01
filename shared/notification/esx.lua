local ESX = exports['es_extended']:getSharedObject()

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
            TriggerClientEvent('esx:showNotification', source, message, notitype, Config.NotificationsTime)
        else -- clientside
            ESX.ShowNotification(message, notitype, Config.NotificationsTime)
        end
    end
}

return Notification