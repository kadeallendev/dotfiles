-- vim.opt.conceallevel = 1
vim.opt.conceallevel = 0
vim.opt.spell = true
vim.opt.foldmethod = 'manual'
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.textwidth = 100

-- Import markdown highlights module
local md = require 'kade.markdown-highlights'
-- Setup markdown functionality if not already initialized
if not md.initialized then
  md.setup()
end

-- Set buffer-local keymap to toggle markdown preview
vim.keymap.set('n', '<leader>m', md.toggle_preview, { desc = 'Toggle markdown preview', buffer = 0 })
