Billing = {

    Create = function(targetId, sharedAccountName, label, amount)
        sharedAccountName = "society_" .. sharedAccountName
        TriggerEvent("esx_billing:sendBill", targetId, sharedAccountName, label, amount)
    end

}

return Billing