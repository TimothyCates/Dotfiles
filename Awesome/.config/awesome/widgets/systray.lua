local wibox = require("wibox")
local awful = require("awful")
local Mouse = require("bindings.mouse")

local systray = wibox.widget.systray()
systray.visible = true

local sysWidgetList = {}
local sysWidget = function(scr)
  local widget = wibox.widget.textbox("󰄠 ")
  widget.font = "Source Sans Pro Bold 15"
  widget.screen = scr
  widget.visible = scr ~= screen.primary

  local updateButtons = function(scr)
    for _, widget in ipairs(sysWidgetList) do
      widget.visible = widget.screen ~= scr
    end
  end

  widget:buttons(
    awful.util.table.join(
      Mouse.onLeftClick(function()
        systray:set_screen(awful.screen.focused())
        updateButtons(awful.screen.focused())
      end)
    )
  )

  widget:connect_signal("mouse::enter", function()
    local w = mouse.current_wibox
    old_cursor, old_wibox = w.cursor, w
    w.cursor = "hand2"
  end)

  widget:connect_signal("mouse::leave", function()
    if old_wibox then
      old_wibox.cursor = old_cursor
      old_wibox = nil
    end
  end)

  table.insert(sysWidgetList, widget)
  return widget
end

return {
  sysWidget = sysWidget,
  systray = systray
}
