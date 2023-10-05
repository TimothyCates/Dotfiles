local awful = require("awful")
-- Custom root signals to prevent race conditions
-- and over-writing objects
local Mouse = require("bindings.mouse")

-- Dynamically create the root button bindings based on the buttons table
local rootButtons = {}

for _, buttonCode in pairs(Mouse.buttons) do
    table.insert(rootButtons, awful.button({}, buttonCode, function()
        awesome.emit_signal("root::button::press", buttonCode)
    end))
end

root.buttons(awful.util.table.join(table.unpack(rootButtons)))
