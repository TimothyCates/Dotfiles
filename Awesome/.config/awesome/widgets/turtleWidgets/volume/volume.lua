local awful = require("awful")
local wibox = require("wibox")
local spawn = require("awful.spawn")
local gears = require("gears")
local beautiful = require("beautiful")
local watch = require("awful.widget.watch")

local function GET_VOLUME_CMD(device) return 'amixer -D ' .. device .. ' sget Master' end
local function INC_VOLUME_CMD(device, step) return 'amixer -D ' .. device .. ' sset Master ' .. step .. '%+' end
local function DEC_VOLUME_CMD(device, step) return 'amixer -D ' .. device .. ' sset Master ' .. step .. '%-' end
local function TOG_VOLUME_CMD(device) return 'amixer -D ' .. device .. ' sset Master toggle' end


local widget_types = {
    horizontal_bar = require("widgets.turtleWidgets.volume.widgets.horizontal-bar-widget"),
}
local volume = {}

local rows  = { layout = wibox.layout.fixed.vertical }

local popup = awful.popup{
    bg = beautiful.bg_normal,
    ontop = true,
    visible = false,
    shape = gears.shape.rounded_rect,
    border_width = 2,
    border_color = "#414868",
    maximum_width = 400,
    offset = { y = 5 },
    widget = {},
    input_passthrough = true,
}

local function build_rows(devices, on_checkbox_click, device_type)
    local device_rows  = { layout = wibox.layout.fixed.vertical }
    for _, device in pairs(devices) do

        local checkbox = wibox.widget {
            checked = device.is_default,
            color = beautiful.fg_empty,
            paddings = 2,
            shape = gears.shape.circle,
            forced_width = 20,
            forced_height = 20,
            check_color = beautiful.fg_focus,
            widget = wibox.widget.checkbox
        }

        checkbox:connect_signal("button::press", function()
            spawn.easy_async(string.format([[sh -c 'pactl set-default-%s "%s"']], device_type, device.id), function()
                on_checkbox_click()
            end)
        end)

        local row = wibox.widget {
            {
                {
                    {
                        checkbox,
                        valign = 'center',
                        layout = wibox.container.place,
                    },
                    {
                        {
                            text = device.name,
                            align = 'left',
                            widget = wibox.widget.textbox
                        },
                        left = 10,
                        layout = wibox.container.margin
                    },
                    spacing = 8,
                    layout = wibox.layout.align.horizontal
                },
                margins = 4,
                layout = wibox.container.margin
            },
            bg = beautiful.bg_normal,
            widget = wibox.container.background
        }

        row:connect_signal("mouse::enter", function(c) c:set_bg(beautiful.bg_focus) end)
        row:connect_signal("mouse::leave", function(c) c:set_bg(beautiful.bg_normal) end)

        local old_cursor, old_wibox
        row:connect_signal("mouse::enter", function()
            local wb = mouse.current_wibox
            old_cursor, old_wibox = wb.cursor, wb
            wb.cursor = "hand1"
        end)
        row:connect_signal("mouse::leave", function()
            if old_wibox then
                old_wibox.cursor = old_cursor
                old_wibox = nil
            end
        end)

        row:connect_signal("button::press", function()
            spawn.easy_async(string.format([[sh -c 'pactl set-default-%s "%s"']], device_type, device.id), function()
                on_checkbox_click()
            end)
        end)

        table.insert(device_rows, row)
    end

    return device_rows
end

local function build_header_row(text)
    return wibox.widget{
        {
            markup = "<b>" .. text .. "</b>",
            align = 'center',
            widget = wibox.widget.textbox
        },
        bg = beautiful.bg_normal,
        widget = wibox.container.background
    }
end

local function parseDevices(output)
    local devices = { sinks = {}, sources = {} }

    local default_sink = io.popen("pactl get-default-sink"):read("*a"):gsub("\n", "")
    local default_source = io.popen("pactl get-default-source"):read("*a"):gsub("\n", "")

    local sink_part, source_part = output:match("(Sinks:.+)(Sources:.+)")

    for id, _, name in sink_part:gmatch("\"(.-)\".-\"(.-)\".-\"(.-)\"") do
        local is_default = id == default_sink
        table.insert(devices.sinks, {id = id, name = name, is_default = is_default})
    end
    
    for id, _, name in source_part:gmatch("\"(alsa_output.-)\".-\"(.-)\".-\"(.-)\"") do
        local is_default = id == default_source
        table.insert(devices.sources, {id = id, name = name, is_default = is_default})
    end

    return devices
end
local function rebuild_popup(move)
    spawn.easy_async([[sh -c "pamixer --list-sinks;pamixer --list-sources"]],function(stdout)
        local devices = parseDevices(stdout)
        for i = 0, #rows do rows[i]=nil end
         
        table.insert(rows, build_header_row("Output"))
        table.insert(rows, build_rows(devices.sinks, function() rebuild_popup() end, "sink"))
        table.insert(rows, build_header_row("Input"))
        table.insert(rows, build_rows(devices.sources, function() rebuild_popup() end, "source"))

        popup:setup(rows)
        if (move) then
            popup:move_next_to(mouse.current_widget_geometry)
        end
    end)
end


local function worker(user_args)

    local args = user_args or {}

    local mixer_cmd = args.mixer_cmd or 'pavucontrol'
    local widget_type = args.widget_type
    local refresh_rate = args.refresh_rate or 0.2
    local step = args.step or 5
    local device = args.device or 'pulse'

    if widget_types[widget_type] == nil then
        volume.widget = widget_types['icon_and_text'].get_widget(args.icon_and_text_args)
    else
        volume.widget = widget_types[widget_type].get_widget(args)
    end

    local function update_graphic(widget, stdout)
        local mute = string.match(stdout, "%[(o%D%D?)%]")   -- \[(o\D\D?)\] - [on] or [off]
        if mute == 'off' then widget:mute()
        elseif mute == 'on' then widget:unmute()
        end
        local volume_level = string.match(stdout, "(%d?%d?%d)%%") -- (\d?\d?\d)\%)
        volume_level = string.format("% 3d", volume_level)
        widget:set_volume_level(volume_level)
    end

    function volume:inc(s)
        spawn.easy_async(INC_VOLUME_CMD(device, s or step), function(stdout) update_graphic(volume.widget, stdout) end)
    end

    function volume:dec(s)
        spawn.easy_async(DEC_VOLUME_CMD(device, s or step), function(stdout) update_graphic(volume.widget, stdout) end)
    end

    function volume:toggle()
        spawn.easy_async(TOG_VOLUME_CMD(device), function(stdout) update_graphic(volume.widget, stdout) end)
    end

    function volume:mixer()
        if mixer_cmd then
            spawn.easy_async(mixer_cmd)
        end
    end

    volume.widget:buttons(
            awful.util.table.join(
                    awful.button({}, 1, function()
                        if popup.visible then
                            popup.visible = not popup.visible
                        else
                            rebuild_popup(true)
                        end
                    end),
                    awful.button({}, 4, function() volume:inc() end),
                    awful.button({}, 5, function() volume:dec() end),
                    awful.button({}, 2, function() volume:mixer() end),
                    awful.button({}, 3, function() volume:toggle() end)
            )
    )

    watch(GET_VOLUME_CMD(device), refresh_rate, update_graphic, volume.widget)

    client.connect_signal("button::press", function(c)
        if popup.visible then
            popup.visible = false
        end
    end)

    awesome.connect_signal("root::button::press", function(m)
        if popup.visible then
            popup.visible = false
        end
    end)

    return volume.widget
end


return setmetatable(volume, { __call = function(_, ...) return worker(...) end })
