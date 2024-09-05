TextUI = {
    ---@param text string
    Show = function(text, position)
        lib.showTextUI(text)
    end,

    Hide = function()
        lib.hideTextUI()
    end
}

return TextUI