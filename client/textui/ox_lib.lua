TextUI = {
    ---comment: Give vehicle keys
    ---@param vehicle number
    ---@param plate string
    Show = function(text)
        lib.showTextUI(text)
    end,

    Hide = function()
        lib.hideTextUI()
    end
}

return TextUI