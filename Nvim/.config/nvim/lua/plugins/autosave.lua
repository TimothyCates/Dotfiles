local ok, autosave = pcall(require, 'autosave')
if not ok then
  return
end

autosave.setup({
  enabled = false,
  execution_message = "",
  events = {},
  conditions = {
    exists = true,
    filename_is_not = {},
    filetype_is_not = {},
    modifiable = true
  },
  write_all_buffers = true,
  on_off_commands = true,
  clean_command_line_interval = 1,
  debounce_delay = 135
})
