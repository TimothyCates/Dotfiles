local gears = require("gears")
local awful = require("awful")

local function bind_key(source, key_bind)
  source(gears.table.join(
    source(),
    awful.key(
      key_bind.modifiers,
      key_bind.key,
      key_bind.action,
      {
        key_bind.description,
        key_bind.group
      }
    )
  ))
end

local function bind_button(source, button_bind)
  source(gears.table.join(
    source(),
    awful.button(
      button_bind.modifiers,
      button_bind.button,
      button_bind.action
    )
  ))
end

root.client_keys = function(t)
  self.keys = key or self.keys or {}
  return self.keys
end

root.client_buttons = function(t)
  self.buttons = buttons or self.buttons or {}
  return self.buttons
end

return {
  global = {
    bindkey = function(key)
      bind_key(root.keys, key)
    end,
    bindbutton = function(button)
      bind_button(root.buttons, button)
    end
  },
  client = {
    bindkey = function(key)
      bind_key(root.client_keys, key)
    end,
    bindbutton = function(button)
      bind_button(root.client_buttons, button)
    end
  }
}
