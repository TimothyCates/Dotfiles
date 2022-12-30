---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gears = require('gears')
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font = "sans 8"

theme.bg_normal   = "#222222"
theme.bg_focus    = "#535d6c"
theme.bg_urgent   = "#ff0000"
theme.bg_minimize = "#444444"
theme.bg_systray  = theme.bg_normal

theme.fg_normal   = "#aaaaaa"
theme.fg_focus    = "#ffffff"
theme.fg_urgent   = "#ffffff"
theme.fg_minimize = "#ffffff"

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height       = dpi(30)
theme.menu_width        = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path .. "default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "default/titlebar/minimize_focus.png"



theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = themes_path .. "default/titlebar/maximized_focus_active.png"

local wallpaper_path = gfs.get_xdg_config_home() .. "Pictures/Wallpapers"
local wallpapers = {}
for s = 1, screen.count() do
    local f = io.popen("sh -c \"find ~/Pictures/Wallpapers/ -name '*.png' -o -name '*.jpg' | shuf -n 1 | xargs echo -n\"")
    local wallpaper = f:read("*all")
    f:close()
    gears.wallpaper.maximized(wallpaper, s, true)
end
-- for wallpaper in lfs.dir(wallpaper_path) do
--   if lfs.attributes(wallpaper_path .. "/" .. wallpaper, "mode") == "file" then
--     table.insert(wallpapers, wallpaper)
--   end
-- end
--local random_wallpaper = wallpapers[math.random(#wallpapers)]



--theme.wallpaper = wallpaper_path .. random_wallpaper


-- You can use your own layout icons like this:
theme.layout_fairh      = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv      = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating   = themes_path .. "default/layouts/floatingw.png"
theme.layout_magnifier  = themes_path .. "default/layouts/magnifierw.png"
theme.layout_max        = themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile       = themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop    = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral     = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle    = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw   = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne   = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw   = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse   = themes_path .. "default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

theme.tasklist_disable_task_name = true

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
