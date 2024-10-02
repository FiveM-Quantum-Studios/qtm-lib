local Anticheat = {
    Ban = function(source, reason)
        DropPlayer(source, reason)
    end,
}

return Anticheat