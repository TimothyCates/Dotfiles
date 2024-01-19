local ok, barbecue = pcall(require, 'barbecue')
if not ok then
  return
end
local c = require("tokyodark.palette")

barbecue.setup({
  theme = {
    normal = { bg = c.bg0, fg = c.fg },
    ellipsis = { fg = c.grey },
    separator = { fg = c.grey },
    modified = { fg = c.yellow },
    dirname = { fg = c.grey },
    basename = { fg = c.fg, bold = true },
    context = { fg = c.fg },
    context_file = { fg = c.fg },
    context_module = { fg = c.yellow },
    context_namespace = { fg = c.yellow },
    context_package = { fg = c.blue },
    context_class = { fg = c.orange },
    context_method = { fg = c.blue },
    context_property = { fg = c.green },
    context_field = { fg = c.green },
    context_constructor = { fg = c.blue },
    context_enum = { fg = c.orange },
    context_interface = { fg = c.orange },
    context_function = { fg = c.blue },
    context_variable = { fg = c.magenta },
    context_constant = { fg = c.magenta },
    context_string = { fg = c.green },
    context_number = { fg = c.orange },
    context_boolean = { fg = c.orange },
    context_array = { fg = c.orange },
    context_object = { fg = c.orange },
    context_key = { fg = c.purple },
    context_null = { fg = c.blue },
    context_enum_member = { fg = c.green },
    context_struct = { fg = c.orange },
    context_event = { fg = c.orange },
    context_operator = { fg = c.green },
    context_type_parameter = { fg = c.green },
  }
})
