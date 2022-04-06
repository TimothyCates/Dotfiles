local ok, colorizer = pcall(require, 'colorizer')
if not ok then
    return
end

colorizer.setup{
    '*';
    css = {
        RRGGBBAA = true,
        css = true,
        css_fn = true,
    }
}

