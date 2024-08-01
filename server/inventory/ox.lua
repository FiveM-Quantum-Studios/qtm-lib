local ox_inventory = exports.ox_inventory

Inventory = {
    ---comment: Get player item count
    ---@param source string
    ---@param item string
    ---@return integer
    GetItemCount = function(source, item)
        return ox_inventory:GetItemCount(source, item)
    end,
    ---comment: Remove item from inventory
    ---@param source string
    ---@param item string
    ---@param quantity integer
    ---@return boolean | 'qs'
    RemoveItem = function(source, item, quantity, metadata, slot)
        return ox_inventory:RemoveItem(source, item, quantity, metadata, slot)
    end,
    ---comment: Add item to inventory
    ---@param source string
    ---@param item string
    ---@param quantity integer
    ---@return boolean | string | 'qs'
    AddItem = function(source, item, quantity, metadata, slot)
        return ox_inventory:AddItem(source, item, quantity, metadata, slot)
    end,
    ---comment: Clear inventory
    ---@param source string
    ---@param keep table
    ---@return boolean
    ClearInventory = function(source, keep)
        return ox_inventory:ClearInventory(source, keep)
    end,
}

return Inventory