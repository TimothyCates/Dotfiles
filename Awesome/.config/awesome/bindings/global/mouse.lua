local awful = require("awful")
local gears = require("gears")

local bindKey = function(key_bind)
  root.buttons(gears.table.join(
    root.buttons(),
    awful.button(
      key_bind.modifiers,
      key_bind.button,
      key_bind.action
    )
  ))
end

bindKey({
  modifiers = {},
  button = 4,
  action = awful.tag.viewprev
})
bindKey({
  modifiers = {},
  button = 5,
  action = awful.tag.viewprev
})
