local ESX = exports['es_extended']:getSharedObject()

Inventory = {
    ---comment: Get player item count
    ---@param source string
    ---@param item string
    ---@return integer
    GetItemCount = function(source, item)
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.getInventoryItem(item).count
    end,
    ---comment: Get item label
    ---@param source string
    ---@param item string
    ---@return string
    GetItemLabel = function(source, item)
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.getInventoryItem(item).label
    end,
    ---comment: Remove item from inventory
    ---@param source string
    ---@param item string
    ---@param quantity integer
    ---@return boolean
    RemoveItem = function(source, item, quantity, metadata, slot)
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.removeInventoryItem(item, quantity)
    end,
    ---comment: Add item to inventory
    ---@param source string
    ---@param item string
    ---@param quantity integer
    ---@return boolean | string
    AddItem = function(source, item, quantity, metadata, slot)
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.addInventoryItem(item, quantity)
    end,
    ---comment: Clear inventory
    ---@param source string
    ---@param keep table
    ---@return boolean
    ClearInventory = function(source, keep)
        local xPlayer = ESX.GetPlayerFromId(source)
        local inventory = xPlayer.getInventory(true) 
        for i = 1, #inventory do
            local invItem = inventory[i]
            if lib.table.contains(keep, invItem.name) then goto next end
            xPlayer.removeInventoryItem(invItem.name, invItem.count)
            ::next::
        end
        return true
    end,

    ForceOpenInventory = function(source, stashType, stashName)
        return 
    end,

    GetInventory = function(source, owner)
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.getInventory(true) 
    end,

    RegisterStash = function(id, label, slots, maxWeight, owner, groups, coords)
        return 
    end
}

return Inventory