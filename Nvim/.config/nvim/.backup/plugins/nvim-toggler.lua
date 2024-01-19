local ok, nvimtoggler = pcall(require, "nvim-toggler")
if not ok then
  return
end

nvimtoggler.setup({
  inverses = {
    ['y'] = 'n',
    ['t'] = 'f',
    ['[ ]'] = '[X]'
  },
  remove_default_keybinds = true,
  remove_default_inverses = false,
})
