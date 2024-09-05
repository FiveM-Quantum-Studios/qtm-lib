TextUI = {
    ---@param text string
    Show = function(text, position)
        SendNUIMessage({
          type = 'show',
          text = text,
          position = position
        })
    end,

    Hide = function()
        SendNUIMessage({
            type = 'hide'
        })
    end
}

return TextUI