return {
  -- Oil, edit directories like buffers
  {
    'stevearc/oil.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('oil').setup {
        default_file_explorer = true,
        columns = { 'icon' },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
        },
        keymaps = {
          ['<C-h>'] = false,
          ['<C-l>'] = false,
          ['<'] = 'actions.parent',
          ['<C-v>'] = 'actions.select_vsplit',
          ['q'] = 'actions.close',
          ['H'] = 'actions.toggle_hidden',
        },
      }

      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
}
