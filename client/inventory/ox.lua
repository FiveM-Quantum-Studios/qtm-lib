local ox_inventory = exports.ox_inventory

Inventory = {
    ---comment: Get item info
    ---@param item string
    ---@return table
    GetItemInfo = function(item)
        return ox_inventory:Items(item)
    end
}

return Inventory