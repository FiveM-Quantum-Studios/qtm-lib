Billing = {

    Create = function(targetId, sharedAccountName, label, amount)
        exports['qs-billing']:ServerCreateInvoice(targetId, 'Bill', 'Please pay this bill in due time to avoid debts.', amount, true, false, false, false, sharedAccountName)
    end
}

return Billing