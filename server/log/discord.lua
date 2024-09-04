local function sendToDiscord(title, message, webhook)
    local embed = {
        {
            color = 8663711,
            title = title,
            description = message,
            footer = {
                text = title,
                icon_url = "https://cdn.discordapp.com/attachments/1253705482795749518/1280233306604044298/Quantum.png?ex=66d755ad&is=66d6042d&hm=fc391fed7e54f516eb7bb4d496052c17c7a275dc5533cd9b800bf4c5a92a36e5&"
            }
        }
    }
    PerformHttpRequest(webhook, function(err, text, headers)
    end, 'POST', json.encode({
        username = title,
        embeds = embed
    }), { ['Content-Type'] = 'application/json' })
end

local Log = {
    Create = function(source, event, message, hook)
        if not IsDuplicityVersion() then return end
        local playerName = GetPlayerName(source)
        local fullMessage = string.format("%s | %s: %s", playerName, event, message)
        sendToDiscord("Quantum Studios", fullMessage, hook)
    end
}

return Log