Inventory = {
    ---comment: Get player item count
    ---@param source string
    ---@param item string
    ---@return integer
    GetItemCount = function(source, item)
        return 0
    end,
    ---comment: Get item label
    ---@param source string
    ---@param item string
    ---@return string
    GetItemLabel = function(source, item)
        return exports["tgiann-inventory"]:GetItemLabel(item)
    end,
    ---comment: Remove item from inventory
    ---@param source string
    ---@param item string
    ---@param quantity integer
    ---@return boolean
    RemoveItem = function(source, item, quantity, metadata, slot)
        return exports["tgiann-inventory"]:RemoveItem(source, item, quantity, slot, metadata)
    end,
    ---comment: Add item to inventory
    ---@param source string
    ---@param item string
    ---@param quantity integer
    ---@return boolean | string
    AddItem = function(source, item, quantity, metadata, slot)
        return exports["tgiann-inventory"]:AddItem(source, item, quantity, metadata, false)
    end,
    ---comment: Clear inventory
    ---@param source string
    ---@param keep table
    ---@return boolean
    ClearInventory = function(source, keep)
        return exports["tgiann-inventory"]:ClearInventory(source)
    end,

    ForceOpenInventory = function(source, stashType, stashName)
        return 
    end,

    GetInventory = function(source, owner)
        return
    end,

    RegisterStash = function(id, label, slots, maxWeight, owner, groups, coords)
        return 
    end
}

return Inventory