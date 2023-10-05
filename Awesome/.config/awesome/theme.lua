local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gears = require('gears')
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font = "Source Sans Pro 12"
theme.lockscreenImages = "Pictures/Wallpapers"

theme.bg_normal   = "#1A1B26"
theme.bg_minimize = "#414868"
theme.bg_focus    = theme.bg_normal
theme.bg_urgent   = theme.bg_normal
theme.bg_systray  = theme.bg_normal

theme.bg_systray = "#1a1b26"
theme.border_systray= "#11121d"

theme.taglist_font = "Source Sans Pro Bold 15"
theme.taglist_spacing = 16
theme.taglist_fg_focus = "#7AA2F7"
theme.taglist_fg_urgent = "#F7768E"
theme.taglist_fg_occupied = "#818CBE"
theme.taglist_fg_empty = "#4B526D"
theme.taglist_fg_volatile = "#FF9E64"


theme.fg_normal   = "#a9b1d6"
theme.fg_focus    = "#bb9af7"
theme.fg_urgent   = "#f7768e"
theme.fg_minimize = "#818bb8"

theme.useless_gap   = dpi(3)
theme.border_width  = dpi(0)
theme.border_normal = "#24283B"
theme.border_focus  = "#7AA2F7"
theme.border_marked = "#DB4B4B"

theme.titlebar_close_button_normal = themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path .. "default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "default/titlebar/minimize_focus.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = themes_path .. "default/titlebar/maximized_focus_active.png"


for s = 1, screen.count() do
    local f = io.popen("sh -c \"find ~/Pictures/Wallpapers/ -name '*.png' -o -name '*.jpg' | shuf -n 1 | xargs echo -n\"")
    local wallpaper = f:read("*all")
    f:close()
    gears.wallpaper.maximized(wallpaper, s, true)
end

theme.tasklist_disable_task_name = true

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "Tokyonight"

return theme
