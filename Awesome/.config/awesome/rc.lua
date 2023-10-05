pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local config = require("config")

-- Load config modules
require("awful.autofocus")
require("signals")
require("bindings.global.mouse")
require("bindings.global.keys")
require("rules")

-- Theme
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")
awful.layout.layouts = config.layouts

-- Inclue Bars/Docks (after theme so they can access colors)
local topbar = require("bars.topbar")

local japaneseNums = {
    "一", "二", "三", "四", "五", "六", "七", "八", "九", "十"
}
local function getTags(s)
    local start = (s.index - 1) * 4 + 1
    local last = start + 3
    local tags = {}

    for i=start, last do
        table.insert(tags, japaneseNums[i])
    end

    return tags
end
-- Bars/Docks
awful.screen.connect_for_each_screen(function(s)
  awful.tag(getTags(s), s, config.layouts[1])
  topbar.addToScreen(s)
end)






