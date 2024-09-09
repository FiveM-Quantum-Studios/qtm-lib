local NotificationTypes = {
    ['success'] = 'success',
    ['error'] = 'error',
    ['info'] = 'success',
    ['warning'] = 'error',
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
            -- Implement later
        else
            SendNUIMessage({
                type = "notification",
                message = message,
                notificationType = notitype  
            })
        end
    end
}

return Notification