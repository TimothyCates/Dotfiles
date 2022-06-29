local ok, nullls = pcall(require, 'nullls')
if not ok then
  return
end

local formatting = nullls.builtins.formatting
local diagnostics = nullls.builtins.diagnostics
local completion = nullls.builtins.completion

nullls.setup {
  sources = {
    formatting.prettierd,
    diagnostics.eslint,
    completion.spell,
    diagnostics.codespell
  }
}
