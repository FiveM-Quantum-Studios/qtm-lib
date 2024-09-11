TextUI = {
    ---@param text string
    Show = function(text, position)
        SendNUIMessage({
          type = 'show-textUI',
          text = text,
          position = position or Config.TextUI.defaultPosition
        })
    end,

    Hide = function()
        SendNUIMessage({
            type = 'hide-textUI'
        })
    end
}

return TextUI