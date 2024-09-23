---@diagnostic disable-next-line
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'go',
    'bash',
    'c',
    'html',
    'lua',
    'markdown',
    'rust',
    'python',
    'yaml',
    'cpp',
    'java',
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = {
      'csv',
      '',
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
