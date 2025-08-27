---@diagnostic disable-next-line
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'go',
    'c',
    'c_sharp',
    'html',
    'lua',
    'markdown',
    'yaml',
    'cpp',
    'javascript',
    'typescript',
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = {
      'csv',
      'powershell'
    },
  },
  indent = { enable = true }
}

require('nvim-treesitter.install').compilers = { 'clang' }
