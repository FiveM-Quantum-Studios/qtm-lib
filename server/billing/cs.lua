Billing = {

    Create = function(targetId, sharedAccountName, label, amount)
        local src = source
        exports['cs_billing']:createBill({
            playerID = targetId,
            society = sharedAccountName,
            society_name = label, 
            amount = amount,
            senderID = src,     
            title = 'Invoice',  
            notes = 'Please Pay ASAP',
        })
    end
}

return Billing