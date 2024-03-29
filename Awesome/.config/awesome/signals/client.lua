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


client.connect_signal("mouse::enter", function(c)

end)

client.connect_signal("focus", function(c)
  c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus", function(c)
  c.border_color = beautiful.border_normal
end)

client.connect_signal("property::floating", function(c)
    if c.floating then
        c.border_width = 4
    else
        c.border_width = beautiful.border_width
    end
end)
client.connect_signal("manage", function(c)
    if config.new_window_master == false then
      if not awesome.startup then awful.client.setslave(c) end
    end
    if c.floating or awful.layout.get(c.screen) == awful.layout.suit.floating then
        awful.placement.centered(c,{honor_workarea=true})
    end
end)

-- Close floating discord on defocus so we can popup anywhere and close anytime
client.connect_signal("unfocus", function(c)
    if c.class == "discord" then
        if c.floating then
            c:kill()
        end
    end
end)

