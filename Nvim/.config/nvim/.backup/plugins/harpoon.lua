local ok, harpoon = pcall(require, "harpoon")
if not ok then
  return
end

harpoon.setup({
  save_on_toggle = false,
  save_on_change = true,
  enter_on_sendcmd = false,
  tmux_autoclose_windows = false,
  excluded_filetypes = { "harpoon" },
  mark_branch = false,
})
