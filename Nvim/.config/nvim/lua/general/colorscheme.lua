vim.g.tokyodark_transparent_background = false
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1.0"
function setColorScheme ()
   vim.cmd("colorscheme tokyodark")
end
if pcall(setColorScheme) then
else
    print ("Colorscheme is missing, try :PackerInstall")
end
