local ok, config = pcall(require, 'kommentary.config')
if not ok then
    return
end

config.configure_language('default', {
    prefer_single_line_comments = true,
    use_consistent_indentation = true,
    ignore_whitespace = false,
})
