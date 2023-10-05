local wibox = require("wibox")
local beautiful = require('beautiful')
local gears = require("gears")

local ICON_DIR = os.getenv("HOME") .. '/.config/awesome/widgets/turtleWidgets/volume/icons/'

local widget = {}


local function recolorSVG(svgPath, name, newColor)
    local f = io.open(svgPath, "r")
    local content = f:read("*all")
    f:close()

    -- If the SVG already contains a fill attribute, modify its value
    if content:find('fill="') then
        content = content:gsub('fill=".-"', 'fill="' .. newColor .. '"')
    else
        -- If not, add the fill attribute to the path tag
        content = content:gsub('<path', '<path fill="' .. newColor .. '"')
    end

    local tempFilePath = "/tmp/turtleWidget_volume_" .. name .. ".svg"
    f = io.open(tempFilePath, "w")
    f:write(content)
    f:close()

    return tempFilePath
end

local function lowOrHigh(value)
end
function widget.get_widget(widgets_args)
    local args = widgets_args or {}

    local main_color = args.main_color or beautiful.fg_normal
    local mute_color = args.mute_color or beautiful.fg_urgent
    local bg_color = args.bg_color or '#ffffff11'
    local width = args.width or 50
    local margins = args.margins or 10
    local with_icon = args.with_icon == true and true or false
    local icons = {
        high = recolorSVG(ICON_DIR .. 'high.svg', 'high', main_color),
        medium = recolorSVG(ICON_DIR .. 'medium.svg', 'medium', main_color),
        low = recolorSVG(ICON_DIR .. 'low.svg', 'low', main_color),
        mute = recolorSVG(ICON_DIR .. 'mute.svg', 'mute', mute_color),
        zero = recolorSVG(ICON_DIR .. 'mute.svg', 'zero', main_color),
        last = ''
    }
    local muted = false
    local bar = wibox.widget {
        {
            {
                id = "icon",
                image = icons.high,
                resize = true,
                forced_height = 16,
                widget = wibox.widget.imagebox,
            },
            valign = 'center',
            visible = with_icon,
            layout = wibox.container.place,
        },
        {
            id = 'bar',
            max_value = 100,
            forced_width = width,
            color = main_color,
            margins = { top = margins, bottom = margins },
            background_color = bg_color,
            shape = function(cr, width, height)
                gears.shape.partially_rounded_rect(cr, width, height, true, true, true, true, 5)
            end,
            widget = wibox.widget.progressbar,
        },
        spacing = -27,
        layout = wibox.layout.fixed.horizontal,
        set_volume_level = function(self, new_value)
            local volume = tonumber(new_value)
            if volume <= 30 and volume >= 1 and not muted then
                self:get_children_by_id('icon')[1]:set_image(icons.low)
                icons.last = icons.low
            elseif volume >= 31 and volume <= 80 and not muted then
                self:get_children_by_id('icon')[1]:set_image(icons.medium)
                icons.last = icons.medium
            elseif volume >= 80 and not muted then
                self:get_children_by_id('icon')[1]:set_image(icons.high)
                icons.last = icons.high
            elseif volume < 1 and not muted then
                self:get_children_by_id('icon')[1]:set_image(icons.zero)
            end
            self:get_children_by_id('bar')[1]:set_value(tonumber(new_value))
        end,
        mute = function(self)
            self:get_children_by_id('bar')[1]:set_color(mute_color)
            self:get_children_by_id('icon')[1]:set_image(icons.mute)
            muted = true
        end,
        unmute = function(self)
            self:get_children_by_id('bar')[1]:set_color(main_color)
            self:get_children_by_id('icon')[1]:set_image(icons.last)
            muted = false
        end
    }

    bar:connect_signal("mouse::enter", function()
        local w = mouse.current_wibox
        old_cursor, old_wibox = w.cursor, w
        w.cursor = "hand2"
    end)

    bar:connect_signal("mouse::leave", function()
        if old_wibox then
            old_wibox.cursor = old_cursor
            old_wibox = nil
        end
    end)

    return bar
end

return widget
