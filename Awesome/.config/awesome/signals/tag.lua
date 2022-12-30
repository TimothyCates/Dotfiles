local awful = require("awful")
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
