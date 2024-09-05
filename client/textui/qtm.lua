TextUI = {
    ---@param text string
    Show = function(text)
        SendNUIMessage({
          type = 'show',
          text = text
        })
    end,

    Hide = function()
        SendNUIMessage({
            type = 'hide'
        })
    end
}

return TextUI