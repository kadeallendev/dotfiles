vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

local function set_hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

set_hl('@import', { fg = 'NvimLightMagenta' })
set_hl('@lsp.typemod.variable.defaultLibrary.typescript', { fg = 'NvimLightYellow' })
set_hl('Type', { fg = 'NvimLightMagenta' })
set_hl('Constant', { fg = 'NvimLightYellow' })

-- Regex
local function regex(group)
  vim.api.nvim_set_hl(0, group, { fg = 'NvimLightMagenta' })
end

regex('@string.regexp.typescript')
regex('@operator.regex')
regex('@string.escape.regex')
regex('@puncutation.delimiter.regex')
regex('@puncutation.bracket.regex')
