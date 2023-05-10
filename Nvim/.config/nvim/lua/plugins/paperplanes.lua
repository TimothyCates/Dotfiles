local ok, paperplanes = pcall(require, "paperplanes")
if not ok then
  return
end

paperplanes.setup({
  register = "+",
  provider = "0x0.st",
  provider_options = {},
  notifier = vim.notify or print,
})
