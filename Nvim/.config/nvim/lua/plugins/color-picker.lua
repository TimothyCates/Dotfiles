local ok, colorpicker = pcall(require, "color-picker")
if not ok then
  return
end

colorpicker.setup({
  ["icons"] = { "ﱢ", "" },
  ["border"] = "single",
  ["background_highlight_group"] = "Normal",  -- default
  ["border_highlight_group"] = "FloatBorder", -- default
  ["text_highlight_group"] = "Normal",        --default
})

vim.cmd([[hi FloatBorder guibg=NONE]])
