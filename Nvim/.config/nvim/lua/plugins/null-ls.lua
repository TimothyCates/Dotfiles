local ok, null_ls = pcall(require, 'null-ls')
if not ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local codeactions = null_ls.builtins.code_actions

null_ls.setup {
  debug = false,
  sources = {
    formatting.prettierd,    -- Web languages
    formatting.lua_format,   -- Lua
    formatting.markdownlint, -- Markdown
    formatting.ruff,         -- Python
    formatting.rustfmt,      -- Rust
    formatting.codespell,    -- Common mispellings

    diagnostics.eslint_d,    -- Eslint but fast
    diagnostics.tsc,         -- Typescript compiler

    codeactions.gitsigns,    -- git code-actions
  }
}
