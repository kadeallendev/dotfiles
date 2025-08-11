vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.api.nvim_set_hl(0, '@import', { fg = 'NvimLightMagenta' })
vim.api.nvim_set_hl(0, '@lsp.typemod.variable.defaultLibrary.typescript', { fg = 'NvimLightYellow' })
vim.api.nvim_set_hl(0, 'Type', { fg = 'NvimLightMagenta' })
vim.api.nvim_set_hl(0, 'Constant', { fg = 'NvimLightYellow' })
-- vim.api.nvim_set_hl(0, '@lsp.type.class.typescript', { fg = 'NvimLightBlue' })

-- vim.highlight.priorities.semantic_tokens = 95
