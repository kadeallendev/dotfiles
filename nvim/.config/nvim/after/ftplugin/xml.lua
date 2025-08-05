vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Highlights
vim.api.nvim_set_hl(0, '@tag.xml', { fg = 'NvimLightBlue' })
vim.api.nvim_set_hl(0, '@string.xml', { fg = 'NvimLightMagenta' })
vim.api.nvim_set_hl(0, '@tag.delimiter.xml', { fg = 'NvimLightGrey4' })
vim.api.nvim_set_hl(0, '@tag.attribute.xml', { fg = 'NvimLightGrey4' })
