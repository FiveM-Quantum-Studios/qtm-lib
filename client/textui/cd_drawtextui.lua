TextUI = {
    ---@param text string
    Show = function(text, position)
        TriggerEvent('cd_drawtextui:ShowUI', 'show', text)
    end,

    Hide = function()
        TriggerEvent('cd_drawtextui:HideUI')
    end
}

return TextUI