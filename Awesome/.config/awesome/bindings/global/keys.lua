local awful = require("awful")
local gears = require("gears")
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
  key = "j",
  action = function()
    awful.client.focus.bydirection("down")
    if client.focus then
      client.focus:raise()
    end
  end,
  description = "go to window below",
  group = "client"
})

global.bindkey({
  modifiers = { key.super },
  key = "k",
  action = function()
    awful.client.focus.bydirection("up")
    if client.focus then
      client.focus:raise()
    end
  end,
  description = "go to window below",
  group = "client"
})

global.bindkey({
  modifiers = { key.super },
  key = "h",
  action = function()
    awful.client.focus.bydirection("left")
    if client.focus then
      client.focus:raise()
    end
  end,
  description = "go to window below",
  group = "client"
})

global.bindkey({
  modifiers = { key.super },
  key = "l",
  action = function()
    awful.client.focus.bydirection("right")
    if client.focus then
      client.focus:raise()
    end
  end,
  description = "go to window below",
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
  modifiers = {key.super},
  key = "space",
  action = function()
    awful.spawn('rofi -show drun')
  end,
  description = "Open Rofi",
  group = "launcher"
})

global.bindkey({
  modifiers = {key.super},
  key = "p",
  action = function()
    awful.spawn.with_shell('rofi-rbw --no-help -t password --clear-after 90')
  end,
  description = "Password Manager",
  group = "launcher"
})

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
  modifiers = {},
  key = "Print",
  action = function()
    awful.spawn.with_shell('flameshot gui -s -c')
  end,
  description = "take a screenshot and copy to clipboard",
  group = "launcher"
})

-- Previous Track
global.bindkey({
  modifiers = {},
  key = "XF86AudioPrev",
  action = function()
    awful.spawn("playerctl previous")
  end,
  description = "previous track",
  group = "media"
})

local can_playpause = true
global.bindkey({
  modifiers = {},
  key = "XF86AudioPlay",
  action = function()
    if can_playpause then
        awful.spawn("playerctl play-pause")
        can_playpause = false
        -- Reset the flag after 0.5 seconds
        gears.timer.start_new(0.2, function()
            can_playpause = true
        end)
    end
  end,
  description = "toggle play",
  group = "media"
})

-- Next Track
global.bindkey({
  modifiers = {},
  key = "XF86AudioNext",
  action = function()
    awful.spawn("playerctl next")
  end,
  description = "next track",
  group = "media"
})

local can_mute = true
-- Mute Audio
global.bindkey({
  modifiers = {},
  key = "XF86AudioMute",
  action = function()
    if can_mute then
        awful.spawn("amixer -q set Master toggle")
        can_mute = false
        -- Reset the flag after 0.5 seconds
        gears.timer.start_new(0.2, function()
            can_mute = true
        end)
    end
  end,
  description = "toggle mute",
  group = "media"
})
-- Volume Up
global.bindkey({
  modifiers = {},
  key = "XF86AudioRaiseVolume",
  action = function()
    awful.spawn("amixer -q set Master 5%+ unmute")
    awesome.emit_signal("volume::change")
  end,
  description = "volume up",
  group = "media"
})

-- Volume Down
global.bindkey({
  modifiers = {},
  key = "XF86AudioLowerVolume",
  action = function()
    awful.spawn("amixer -q set Master 5%- unmute")
    awesome.emit_signal("volume::change")
  end,
  description = "volume down",
  group = "media"
})
