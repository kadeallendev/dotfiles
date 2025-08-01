vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.cmd [[
  hi Statement guifg=NvimLightGreen
  hi Type guifg=NvimLightYellow
  hi String guifg=NvimLightMagenta
  hi Function guifg=NvimLightBlue
]]

-- Give treesitter highlighting priority
vim.highlight.priorities.semantic_tokens = 95
