vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Highlights
vim.api.nvim_set_hl(0, 'Function', { fg = 'NvimLightBlue' })
vim.api.nvim_set_hl(0, 'String', { fg = 'NvimLightMagenta' })
vim.api.nvim_set_hl(0, 'Type', { fg = 'NvimLightYellow' })
vim.api.nvim_set_hl(0, 'Statement', { fg = 'NvimLightGreen' })

-- Give treesitter highlighting priority
vim.highlight.priorities.semantic_tokens = 95
