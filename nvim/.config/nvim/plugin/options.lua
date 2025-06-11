local utils = require 'kade.utils'
local opt = vim.opt

-- Line Numbers {{{
opt.number = true -- Turn on line numbers
opt.relativenumber = true -- Relative numbers
-- }}}

-- Mouse {{{
opt.mouse = 'a'
-- }}}

-- Language
opt.spelllang = 'en_us,en_nz'

-- Tabs {{{
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.smartindent = true
-- }}}

-- Don't show the mode, since it's already in status line
opt.showmode = false

-- Show substitute commands in preview window rather than inplace in buffer.
opt.inccommand = 'split'

-- Clipboard {{{
opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
-- }}}

-- Enable break indent
opt.breakindent = true

-- Folding
opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
opt.foldcolumn = '0'
opt.foldlevel = 99
-- opt.foldlevelstart = 1

-- Save undo history
opt.undofile = true
opt.undodir = vim.fn.stdpath 'data' .. '/undo'

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Find path
opt.path = '.,,**'

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Show which line your cursor is on
-- opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 12

-- Set highlight on search, but clear on pressing <Esc> in normal mode
opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Line column
-- vim.opt.colorcolumn = '100'

-- Disable folding auto
-- opt.foldlevelstart = 99

-- Term colors
opt.termguicolors = true

-- Ignore certain files
opt.wildignore:append '.git'
opt.wildignore:append '.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class'
opt.wildignore:append '.swp,.lock,.DS_Store,._*'
opt.wildignore:append '.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kbg'

-- Undercurl
vim.cmd [[let &t_Cs = "\e[4:3m"]]
vim.cmd [[let &t_Ce = "\e[4:0m"]]

-- Something with hidden buffers
opt.hidden = true

-- Disable wrapping
opt.wrap = false

-- Completion
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.shortmess:append 'c'

-- Terminal shell
if utils.is_windows() then
  vim.o.shell = 'powershell.exe'
end

-- Diff opts
vim.opt.diffopt:append 'vertical'
