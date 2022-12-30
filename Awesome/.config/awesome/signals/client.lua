local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local config = require("config")

client.connect_signal("manage", function(c)
  if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
    awful.placement.no_offscreen(c)
  end

  -- Allow float windows to spawn with titlebars
  if config.titlebars_floating then
    if c.floating or c.first_tag.layout.name == "floating" then
      awful.titlebar.show(c)
    else
      awful.titlebar.hide(c)
    end
  end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
  local buttons = gears.table.join(
    awful.button(
      {},
      1,
      function()
        c:emit_signal(
          "request::activate",
          "titlebar",
          { raise = true }
        )
        awful.mouse.client.move(c)
      end
    ),
    awful.button(
      {},
      3,
      function()
        c:emit_signal(
          "request::activate",
          "titlebar",
          { raise = true }
        )
        awful.mouse.client.resize(c)
      end
    )
  )

  awful.titlebar(c):setup {
    { -- Left
      awful.titlebar.widget.iconwidget(c),
      buttons = buttons,
      layout  = wibox.layout.fixed.horizontal
    },
    { -- Middle
      { -- Title
        align  = "left",
        widget = awful.titlebar.widget.titlewidget(c)
      },
      buttons = buttons,
      layout  = wibox.layout.flex.horizontal
    },
    { -- Right
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.closebutton(c),
      layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
  }
end)

-- Manage floating titlebars
client.connect_signal("property::floating", function(c)
  if not config.titlebars_always then
    if config.titlebars_floating then
      if c.floating then
        awful.titlebar.show(c)
      else
        awful.titlebar.hide(c)
      end
    else
      awful.titlebar.hide(c)
    end
  end
end)


-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
