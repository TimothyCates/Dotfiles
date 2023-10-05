local awful = require("awful")

local buttons = {
  left = 1,
  middle = 2,
  right = 3,
  scrollUp = 4,
  scrollDown = 5,
}

local function handleArgs(arg1, arg2)
    if arg2 then
        return arg1, arg2
    elseif type(arg1) == "function" then
        return {}, arg1
    end
    return nil, nil
end

local function mouseEvent(button, arg1, arg2)
    local mods, callback = handleArgs(arg1, arg2)
    if mods and callback then
        return awful.button(mods, button, callback)
    end
end

return {
    buttons = buttons,
    onLeftClick = function(arg1, arg2) return mouseEvent(buttons.left, arg1, arg2) end,
    onRightClick = function(arg1, arg2) return mouseEvent(buttons.right, arg1, arg2) end,
    onScrollUp = function(arg1, arg2) return mouseEvent(buttons.scrollUp, arg1, arg2) end,
    onScrollDown = function(arg1, arg2) return mouseEvent(buttons.scrollDown, arg1, arg2) end,
}

