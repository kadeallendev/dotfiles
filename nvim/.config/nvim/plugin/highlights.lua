-- Background
-- NOTE: not too sure about this one
-- vim.cmd [[hi Normal guibg=NvimDarkGrey1]]
-- NormalNC changes inactive windows

-- General
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = 'NvimDarkGrey3' })
vim.api.nvim_set_hl(0, 'Folded', { fg = 'NvimLightBlue', bg = 'NvimDarkGrey3' })

-- Windows
vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Pmenu' })

-- Line numbers
vim.api.nvim_set_hl(0, 'LineNr', { fg = 'NvimLightBlue' })
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'NvimDarkGray4' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = 'NvimDarkGrey4' })

-- Quickfix
vim.api.nvim_set_hl(0, 'QuickFixLine', { fg = 'NvimDarkGrey2', bg = 'NvimLightBlue' })
vim.api.nvim_set_hl(0, 'qfFileName', { fg = 'NvimLightBlue' })
vim.api.nvim_set_hl(0, 'qfLineNr', { fg = 'NvimDarkGrey4' })
