local awful = require("awful")
local gears = require("gears")
local mod = require("bindings.keys")

local function setState(client, state)
  if (client[state]) then
    client.maximized = false
    client.fullscreen = false
    client.floating = false
  else
    client.maximized = false
    client.fullscreen = false
    client.floating = false
    client[state] = true
  end
end

return gears.table.join(
  awful.key(
    { mod.super },
    "f",
    function(c)
      setState(c, "fullscreen") 
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
    "d",
    function(c)
      setState(c, "floating")
    end,
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
      setState(c, "maximized")
      c:raise()
    end,
    {
      description = "toggle maximize",
      group = "client"
    }
  )
)
