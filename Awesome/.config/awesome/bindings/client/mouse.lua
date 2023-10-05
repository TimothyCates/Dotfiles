local awful = require("awful")
local gears = require("gears")
local mod = require("bindings.keys")

return gears.table.join(
-- Click to gain focus
  awful.button(
    {},
    1,
    function(c)
      c:emit_signal("request::activate", "mouse_click", { raise = true })
    end
  ),
  -- Modkey + click to move
  awful.button(
    { mod.super },
    1,
    function(c)
      c:emit_signal(
        "request::activate",
        "mouse_click",
        { raise = true }
      )
      awful.mouse.client.move(c)
    end
  ),
  -- Modkey + Rclick to resize
  awful.button(
    { mod.super },
    3,
    function(c)
      c:emit_signal("request::activate", "mouse_click", { raise = true })
      awful.mouse.client.resize(c)
    end
  )
)
