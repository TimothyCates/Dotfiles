local awful = require("awful")
local beautiful = require("beautiful")
local clientKeys = require("bindings.client.keys")
local clientMouse = require("bindings.client.mouse")

awful.rules.rules = {
  --Global rule, ensures no overlap or offscreen
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientKeys,
      buttons = clientMouse,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
  },
  require("rules.floating"),
  require("rules.fullscreen"),
  require("rules.mappedApps"),
  require("rules.titlebars")
}
