local ok, hlargs = pcall(require, 'hlargs')
if not ok then
  return
end
local c = require("tokyodark.palette")
hlargs.setup({
  color = c.purple
})
