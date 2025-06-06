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

-- StatusLine
-- TODO: Update statusline
vim.cmd [[ hi StatusLine guibg=NvimLightGrey4]]

-- Line numbers
vim.cmd [[
  hi LineNr guifg=NvimLightBlue
  hi LineNrAbove guifg=NvimDarkGray4
  hi LineNrBelow guifg=NvimDarkGray4
]]

-- TODO:
-- QuickFixLine: LineNr seems to fuck with line numbers in quickfix
