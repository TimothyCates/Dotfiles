local ok, autosave = pcall(require, 'autosave')
if not ok then
    return
end

autosave.setup({
    enabled = true,
    execution_message = function ()
        return "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S")
    end,
    events = {"InsertLeave", "TextChanged"},
    conditions = {
        exists = true,
        filename_is_not = {"plugins.lua"},
        filetype_is_not = {},
        modifiable = true,
    },
    write_all_buffers = false,
    on_off_commands = false,
    clean_command_line_interval = 0,
    debounce_delay = 500
})

