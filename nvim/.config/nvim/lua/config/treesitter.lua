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
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = {
      'csv',
    },
  },
  indent = { enable = true },
  matchup = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>rx'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>rX'] = '@parameter.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']f'] = '@function.outer',
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']F'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[f'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[F'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ['<leader>K'] = '@function.outer',
        ['<leader>df'] = '@function.outer',
        ['<leader>dF'] = '@class.outer',
      },
    },
  },
}

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.powershell = {
  install_info = {
    url = vim.fn.stdpath 'data' .. '/tsparsers/tree-sitter-powershell',
    files = { 'src/parser.c' },
    branch = 'main',
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
  },
  filetype = 'ps1',
}
