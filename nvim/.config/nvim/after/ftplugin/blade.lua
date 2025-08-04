local config = vim.fn.stdpath 'config'
vim.cmd('source ' .. config .. '/after/ftplugin/html.lua')

vim.cmd [[
  hi Special gui=bold guifg=NvimLightGreen
]]
