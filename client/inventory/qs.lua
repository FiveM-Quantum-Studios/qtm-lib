Inventory = {
    ---comment: Get item info
    ---@param item string
    ---@return table
    GetItemInfo = function(item)
        return exports['qs-inventory']:GetItemList()[item]
    end
}

return Inventory