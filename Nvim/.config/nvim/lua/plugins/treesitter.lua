local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end
treesitter.setup {
  ensure_installed = {
    "c", "lua", "javascript", "rust", "comment",
    "cpp", "css", "dot", "gitignore", "go", "java",
    "json", "typescript", "yuck"
  },
  auto_install = true
}
