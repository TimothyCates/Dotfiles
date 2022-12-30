local awful = require("awful")
local config = require("config")
local global = require("bindings").global
local key = require("bindings.keys")

--Specifically for hotkey helper
--remove if you dont need this
local hotkeys_popup = require("awful.hotkeys_popup")

-- Show hotkey help, remove if you dont need this
global.bindkey({
  modifiers = { key.super },
  key = "s",
  action = hotkeys_popup.show_help,
  description = "Show this menu",
  group = "awsome"
})

-- Tag navigation
global.bindkey({
  modifiers = { key.super },
  key = "Left",
  action = awful.tag.viewprev,
  description = "go to previous tag",
  group = "tag"
})
global.bindkey({
  modifiers = { key.super },
  key = "Right",
  action = awful.tag.viewnext,
  description = "go to next tag",
  group = "tag"
})

-- Window navigation
global.bindkey({
  modifiers = { key.super },
  key = "h",
  action = awful.client.focus.byidx(1),
  description = "go to next window in layout",
  group = "client"
})
global.bindkey({
  modifiers = { key.super },
  key = "l",
  action = awful.client.focus.byidx(-1),
  description = "go to previous window in layout",
  group = "client"
})
global.bindkey({
  modifiers = { key.super },
  key = key.tab,
  action = function()
    awful.client.focus.history.previous()
    if client.focus then
      client.focus:raise()
    end
  end,
  description = "go to last used window",
  group = "client"
})

-- Window manipulation
global.bindkey({
  modifiers = { key.super, key.shift },
  key = "l",
  action = function()
    awful.client.swap.byidx(1)
  end,
  description = "swap with next window in layout",
  group = "client"
})
global.bindkey({
  modifiers = { key.super, key.shift },
  key = "h",
  action = function()
    awful.client.swap.byidx(-1)
  end,
  description = "swap with previous window in layout",
  group = "client"
})

--Screen navigation
global.bindkey({
  modifiers = { key.super, key.control },
  key = "l",
  action = function()
    awful.screen.focus_relative(1)
  end,
  description = "go to next screen",
  group = "screen"
})
global.bindkey({
  modifiers = { key.super, key.control },
  key = "h",
  action = function()
    awful.screen.focus_relative(-1)
  end,
  description = "go to previous screen",
  group = "screen"
})

-- Controlling awesome
global.bindkey({
  modifiers = { key.super, key.control },
  key = "r",
  action = awesome.restart,
  description = "reload awsome",
  group = "awesome"
})

-- Application shortcuts
global.bindkey({
  modifiers = { key.super },
  key = key.enter,
  action = function()
    awful.spawn(config.apps.terminal)
  end,
  description = "open the terminal specified in config/init.lua",
  group = "launcher"
})
global.bindkey({
  modifiers = { key.super },
  key = "r",
  action = function()
    awful.spawn(awful.screen.focused().mypromptbox:run())
  end,
  description = "run prompt",
  group = "launcher"
})
