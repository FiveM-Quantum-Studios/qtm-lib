Dispatch = {
    Create = function(targetId, sharedAccountName, label, amount)
        local src = source
        local player = exports.qbx_core:GetPlayer(src)
        if not player or player.PlayerData.job.type ~= sharedAccountName then return end
    
        local targetPlayer = exports.qbx_core:GetPlayer(targetId)
        if not targetPlayer then return end
    
        if not targetPlayer.Functions.RemoveMoney('bank', amount, 'paid-bills') then return end
        exports['Renewed-Banking']:addAccountMoney(sharedAccountName, amount)
    end
}

return Dispatch