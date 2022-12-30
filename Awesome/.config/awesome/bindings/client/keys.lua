local awful = require("awful")
local gears = require("gears")
local mod = require("bindings.keys")

return gears.table.join(
  awful.key(
    { mod.super },
    "f",
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {
      description = "toggle fullscren",
      group = "client"
    }
  ),
  awful.key(
    { mod.super, mod.control },
    mod.enter,
    function(c)
      c:swap(awful.client.getmaster())
    end,
    {
      description = "move to master",
      group = "client"
    }
  ),
  awful.key(
    { mod.super },
    "c",
    function(c)
      c:kill()
    end,
    {
      description = "close",
      group = "client"
    }
  ),
  awful.key(
    { mod.super },
    "space",
    awful.client.floating.toggle,
    {
      description = "toggle floating",
      group = "client"
    }
  ),
  awful.key(
    { mod.super },
    "o",
    function(c)
      c:move_to_screen()
    end,
    {
      description = "swap screen",
      group = "client"
    }
  ),
  awful.key(
    { mod.super },
    "t",
    function(c)
      c.ontop = not c.ontop
    end,
    {
      description = "toggle keep on top",
      group = "client"
    }
  ),
  awful.key(
    { mod.super },
    "m",
    function(c)
      c.maximized = not c.maximized
      c:raise()
    end,
    {
      description = "toggle maximize",
      group = "client"
    }
  )
)
