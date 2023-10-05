local awful = require("awful")
local gears = require("gears")
local key = require("bindings.keys")
local mouse = require("bindings.mouse")

local taglist_buttons = gears.table.join(
  mouse.onLeftClick(function(t) t:view_only() end),
  --Move window to tag
  mouse.onLeftClick({key.super}, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  
  mouse.onRightClick(awful.tag.viewtoggle),
  --Add/Remove window from tag (allows window to be in two tags at once)
  mouse.onRightClick({key.super}, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),

  mouse.onScrollUp(function(t) awful.tag.viewnext(t.screen) end),
  mouse.onScrollDown(function(t) awful.tag.viewprev(t.screen) end)
)

return function(screen)
  return awful.widget.taglist {
    screen = screen,
    filter = awful.widget.taglist.filter.all,
    buttons = taglist_buttons
  }
end

