-- Background
-- NOTE: not too sure about this one
-- vim.cmd [[hi Normal guibg=NvimDarkGrey1]]
-- NormalNC changes inactive windows

-- General
vim.cmd [[
  hi ColorColumn guibg=NvimDarkGray3 
  hi Folded guifg=NvimLightBlue guibg=NvimDarkGray3
]]

-- Windows
vim.cmd [[
  hi! link NormalFloat Pmenu
]]

-- Line numbers
vim.cmd [[
  hi LineNr guifg=NvimLightBlue
  hi LineNrAbove guifg=NvimDarkGray4
  hi LineNrBelow guifg=NvimDarkGray4
]]

-- Quickfix
vim.cmd [[
  hi QuickFixLine guibg=NvimLightBlue guifg=NvimDarkGrey2
  hi qfFileName guifg=NvimLightBlue
  hi qfLineNr guifg=NvimDarkGrey4
]]
