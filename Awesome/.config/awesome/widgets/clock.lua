local wibox = require("wibox")

local clock = wibox.widget.textclock('%l:%M')
clock:set_font("Source Sans Pro 18")

clock:connect_signal("mouse::enter", function()
    local w = mouse.current_wibox
    if(w)then
        old_cursor, old_wibox = w.cursor, w
        w.cursor = "hand2"
    end
end)

clock:connect_signal("mouse::leave", function()
    if old_wibox then
        old_wibox.cursor = old_cursor
        old_wibox = nil
    end
end)

return clock

