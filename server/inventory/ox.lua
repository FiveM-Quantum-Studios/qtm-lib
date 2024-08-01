if GetResourceState('ox_inventory') ~= 'started' then return end

local ox_inventory = exports.ox_inventory

Inventory = {
    GetItemCount = function(source, item)
        return ox_inventory:GetItemCount(source, item)
    end,

    RemoveItem = function(source, item, quantity)
        return ox_inventory:RemoveItem(source, item, quantity)
    end,

    AddItem = function(source, item, quantity)
        return ox_inventory:AddItem(source, item, quantity)
    end,

    ClearInventory = function(source, keep)
        return ox_inventory:ClearInventory(source, keep)
    end,
}

return Inventory