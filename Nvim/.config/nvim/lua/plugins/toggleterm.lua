local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
  return
end
local colors = require("tokyodark.palette")

toggleterm.setup({
  size = 10,
  open_mapping = null,
  hide_numbers = true,
  shade_terminals = false,
  shading_factor = '-30',
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
  highlights = {
    Normal = {
      guibg = colors.bg0
    }
  },
  float_opts = {
    border = 'single',
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})
