local ok, neoscroll = pcall(require, 'neoscroll')
if not ok then
    return
end

neoscroll.setup({
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
    '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,
    stop_eof = false,
    use_local_scrolloff = false,
    respect_scrolloff = false,
    cursor_scrolls_alone = true,
    performance_mode = false,
})
