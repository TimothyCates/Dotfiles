local ok, colorizer = pcall(require, 'colorizer')
if not ok then
  return
end

colorizer.setup({
  '*';
},
  {
    RRGGBBAA = true; -- #RRGGBBAA hex codes
    css      = true; -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    mode     = 'background'; -- Set the display mode.
  })
