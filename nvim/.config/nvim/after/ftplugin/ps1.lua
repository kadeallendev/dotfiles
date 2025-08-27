vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.highlight.priorities.semantic_tokens = 90

local set_hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

set_hl('@variable.parameter.builtin.powershell', { fg = 'NvimLightGrey3' })
set_hl('@variable.environment.powershell', { fg = "NvimLightYellow" })
set_hl('Type', { fg = "NvimLightMagenta" })
set_hl('@type.builtin.powershell', { link = 'Type' })
