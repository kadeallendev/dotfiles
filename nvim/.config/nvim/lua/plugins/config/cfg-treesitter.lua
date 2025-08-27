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

-- local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
-- parser_config.powershell = {
--   install_info = {
--     url = vim.fn.stdpath 'data' .. '/tsparsers/tree-sitter-powershell',
--     files = { 'src/parser.c' },
--     branch = 'main',
--     generate_requires_npm = false,
--     requires_generate_from_grammar = false,
--   },
--   filetype = 'ps1',
-- }
