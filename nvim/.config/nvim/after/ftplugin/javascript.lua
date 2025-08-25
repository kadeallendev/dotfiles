-- vim.opt.tabstop = 2
-- vim.opt.softtabstop = 2
-- vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.api.nvim_set_hl(0, '@variable.javascript', { fg = 'NvimLightBlue' })
vim.api.nvim_set_hl(0, 'Special', { fg = 'NvimLightMagenta' })

local function regex(group)
  vim.api.nvim_set_hl(0, group, { fg = 'NvimLightMagenta' })
end

regex('@string.regexp.typescript')
regex('@operator.regex')
regex('@string.escape.regex')
regex('@puncutation.delimiter.regex')
regex('@puncutation.bracket.regex')
