local ok, indenter = pcall(require, 'indent_blankline')
if not ok then
  return
end

indenter.setup {
  show_current_context = true,
}
