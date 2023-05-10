local ok, bufferline = pcall(require, 'bufferline')
if not ok then
  return
end
local c = require("tokyodark.palette")

-- I only want the editor to have no bg
bufferline.setup({
  highlights = {
    fill = {
      bg = c.bg1
    },
    background = {
      bg = c.bg1
    },
    tab_selected = {
      bg = c.bg1
    },
    buffer_visible = {
      bg = c.bg0,
      fg = c.fg
    },
    buffer_selected = {
      bg = c.bg0
    },
    close_button = {
      bg = c.bg0
    },
    close_button_selected = {
      bg = c.bg0
    },
    close_button_visible = {
      bg = c.bg0
    },
    modified_visible = {
      bg = c.bg0
    },
    modified_selected = {
      bg = c.bg0
    },
    separator = {
      bg = c.bg0
    },
    separator_visible = {
      bg = c.bg0
    },
    separator_selected = {
      bg = c.bg0
    },
    indicator_selected = {
      bg = c.bg0
    },
    indicator_visible = {
      bg = c.bg0
    },
    offset_separator = {
      fg = c.bg0
    },
    duplicate = {
      bg = c.bg1
    },
    duplicate_visible = {
      bg = c.bg0
    },
    duplicate_selected = {
      bg = c.bg0
    }
  },
  options = {
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    indicator = {
      style = "underline"
    },
    diagnostics = false,
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' }
    },
    separator_style = { "", "" },
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "BufferLineBufferVisible",
        text_align = "center",
        separator = "█"
      }
    }
  },
})
