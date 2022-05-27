local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
    return
end
configs.setup {
    sync_install = false,
    ignore_install = {""},
    highlight = {
        enable = true,
        disable = {""},
    },
    autotag = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
    },
    textsubject = {
        enable = true,
        prev_selection = ',',
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
        },
    },
    context_commentstring = {
        enable = true,
    },
}
