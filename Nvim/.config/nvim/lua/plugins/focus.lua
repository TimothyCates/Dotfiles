local ok, focus = pcall(require, 'focus')
if not ok then
    return
end

focus.setup(
    {
        signcolumn = false, -- Does not play nice with nvim-tree
    }
)
