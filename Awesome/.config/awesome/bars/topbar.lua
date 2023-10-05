local wibox = require("wibox")
local awful = require("awful")

-- Widgets
local clock = require("widgets.clock")
local taglist = require("widgets.taglist")
local systray = require("widgets.systray")
local calendar_w = require("widgets.turtleWidgets.calendar.calendar")
local power = require("widgets.turtleWidgets.logout.logout")
local volume = require("widgets.turtleWidgets.volume.volume")
local beautiful = require("beautiful")

local layouts = {
  fixed = wibox.layout.fixed.horizontal,
  align = wibox.layout.align.horizontal
}

local calendar = calendar_w({
  theme = "tokyonight",
  placement = "top_right",
  start_sunday = true,
  radius = 8
})

clock:connect_signal ("button::press", function(_,_,_, button)
    if button == 1 then calendar.toggle() end
end)

local addToScreen = function(screen)
  padding = {
    left = 15,
    right = 15,
    top = 0,
    bottom = 0
  }
  local bar = awful.wibar({
    position = "top",
    screen = screen
  })

  local leftWidgets = wibox.container.margin(wibox.widget{
    layout = layouts.fixed,
    taglist(screen)
  }, padding.left, 0, padding.top, padding.bottom)

  local middleWidgets = wibox.container.margin(wibox.widget{
    layout = layouts.fixed
  }, 0, 0, padding.top, padding.bottom)

  local rightWidgets = wibox.container.margin(wibox.widget{
    spacing = 8,
    layout = layouts.fixed,
    volume({
      widget_type = "horizontal_bar",
      bg_color = beautiful.border_normal,
      icon_dir = "~/.config/awesome/widgets/turtleWidgets/volume/icons/",
      with_icon = true,
      refresh_rate = 0.08
    }),
    systray.systray,
    systray.sysWidget(screen),
    clock,
    power.widget{}
  },0, padding.right, padding.top, padding.bottom)

  bar:setup({
    expand = "none",
    layout = layouts.align,
    leftWidgets,
    middleWidgets,
    rightWidgets
  })
  return bar
end

return {
  addToScreen = addToScreen
}
