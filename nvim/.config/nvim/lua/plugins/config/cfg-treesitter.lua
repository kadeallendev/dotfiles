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
    },
  },
  indent = { enable = true },
  textobjects = {
    lsp_interop = {
      enable = true,
      peek_definition_code = {
        ['<leader>K'] = '@function.outer'
      }
    },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']f'] = '@function.outer',
        -- [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        -- [']M'] = '@function.outer',
        [']F'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        -- ['[m'] = '@function.outer',
        ['[f'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        -- ['[M'] = '@function.outer',
        ['[F'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  }
}

require('nvim-treesitter.install').compilers = { 'clang' }
