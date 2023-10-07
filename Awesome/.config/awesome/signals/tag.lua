local awful = require("awful")
-- Tells of is client is on a specific tag
local function is_client_on_tag(c, t)
    for _, tag in ipairs(c:tags()) do
        if tag == t then
            return true
        end
    end
    return false
end

-- Make all windows respect titlebar rules
tag.connect_signal("property::layout", function(c)
  local clients = c:clients()
  for k, v in pairs(clients) do
    if v.floating or v.first_tag.layout.name == "floating" then
      awful.titlebar.show(v)
    else
      awful.titlebar.hide(v)
    end
  end
end)

-- Close discord if we switch off its tag
tag.connect_signal("property::selected", function(t)
    if not t.selected then
        for _, c in ipairs(client.get()) do
            if c.class == "discord" and is_client_on_tag(c, t) then
                c:kill()
            end
        end
    end
end)
