Billing = {

    Create = function(targetId, sharedAccountName, label, amount)
        local src = source
        TriggerServerEvent("okokBilling:CreateCustomInvoice", targetId, amount, "Bill", src, sharedAccountName, label)
    end

}

return Billing