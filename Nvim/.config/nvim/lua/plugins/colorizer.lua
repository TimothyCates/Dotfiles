local ok, colorizer = pcall(require, 'colorizer')
if not ok then
  return
end
colorizer.setup {
  filetypes = { "*" },
  user_default_options = {
    RRGGBBAA = true,
    css = true,
    tailwind = true,
    sass = {
      enable = true,
      parsers = { "css" },
    },
    virtualtext = "■",
    always_update = true
  },
}
