return {
    {
        "timothycates/tokyonight",
        lazy = false,
        priority = 1000,
        init = function()
            vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = none, fg =  none })
        end,
        opts = {
            style = "darker",
            styles = {
                transparent = true,
                comments = { italic = true },
                keywords = { italic = true },
                identifiers = { italic = true },
                functions = {},
                variables = {},
                sidebars = "dark",
                floats = "normal"
            },
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme "tokyonight"
        end
    },
}
