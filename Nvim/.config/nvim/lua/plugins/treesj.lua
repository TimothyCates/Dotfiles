local ok, treesj = pcall(require, 'treesj')
if not ok then
  return
end
treesj.setup {
  use_default_keymaps = false,
  check_syntax_errors = false,
  max_join_length = 10000
}
