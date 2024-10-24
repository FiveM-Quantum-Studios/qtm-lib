local origen_inventory = exports.origen_inventory

Inventory = {
    ---comment: Get player item count
    ---@param source string
    ---@param item string
    ---@return integer
    GetItemCount = function(source, item)
        return origen_inventory:GetItemCount(source, item)
    end,
    ---comment: Get item label
    ---@param source string
    ---@param item string
    ---@return string
    GetItemLabel = function(source, item)
        return origen_inventory:GetItemLabel(item)
    end,
    ---comment: Remove item from inventory
    ---@param source string
    ---@param item string
    ---@param quantity integer
    ---@return boolean
    RemoveItem = function(source, item, quantity, metadata, slot)
        return origen_inventory:RemoveItem(source, item, quantity, slot, nil, metadata)
    end,
    ---comment: Add item to inventory
    ---@param source string
    ---@param item string
    ---@param quantity integer
    ---@return boolean | string
    AddItem = function(source, item, quantity, metadata, slot)
        return origen_inventory:AddItem(source, item, quantity, slot, nil, metadata)
    end,
    ---comment: Clear inventory
    ---@param source string
    ---@param keep table
    ---@return boolean
    ClearInventory = function(source, keep)
        return origen_inventory:ClearInventory(source, keep)
    end,

    ForceOpenInventory = function(source, stashType, stashName)
        return origen_inventory:OpenInventory(source, stashType, stashName)
    end,

    GetInventory = function(source, owner)
        return origen_inventory:GetInventory(source)
    end,

    RegisterStash = function(id, label, slots, maxWeight, owner, groups, coords)
        return origen_inventory:RegisterStash(id, {
            label = label,
            slots = slots,
            weight = maxWeight
        })
    end
}

return Inventory