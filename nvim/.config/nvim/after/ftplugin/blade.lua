local config = vim.fn.stdpath 'config'
vim.cmd('source ' .. config .. '/after/ftplugin/html.lua')

-- Highlights
vim.api.nvim_set_hl(0, 'Special', { fg = 'NvimLightGreen', bold = true })
