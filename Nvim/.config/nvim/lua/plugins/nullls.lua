local ok, nullls = pcall(require, 'nullls')
if not ok then
  return
end

local formatting = nullls.builtins.formatting
local diagnostics = nullls.builtins.diagnostics

nullls.setup {
  debug = false,
  sources = {
    formatting.prettierd,
    diagnostics.eslint,
  }
}
