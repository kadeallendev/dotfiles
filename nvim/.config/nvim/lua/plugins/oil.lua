return {
  -- Oil, edit directories like buffers
  {
    'stevearc/oil.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local oil = require 'oil'
      oil.setup {
        default_file_explorer = true,
        columns = { 'icon' },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
        },
        keymaps = {
          -- Disable these so we can switch windows
          ['<C-h>'] = false,
          ['<C-l>'] = false,
          -- Enable yanking without getting the id and icon
          ['y'] = 'actions.yank_entry',
          -- Vertical split
          ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
          ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
          ['q'] = 'actions.close', -- Easy close
          -- Toggle hidden
          ['H'] = 'actions.toggle_hidden',
          -- Refresh
          ['gr'] = 'actions.refresh',
          -- Toggle detail view
          ['gd'] = {
            desc = 'Toggle file detail view',
            callback = function()
              detail = not detail
              if detail then
                oil.set_columns { 'icon', 'permissions', 'size', 'mtime' }
              else
                oil.set_columns { 'icon' }
              end
            end,
          },
          -- Send to qf list
          ['<C-q>'] = 'actions.send_to_qflist',
        },
        float = {
          padding = 10,
          border = 'solid',
          max_width = 0.4,
          max_height = 0.5,
        },
        confirmation = {
          border = 'solid',
        },
        progress = {
          border = 'solid',
        },
        keymaps_help = {
          border = 'solid',
        },
      }

      vim.keymap.set('n', '-', oil.open, { desc = 'Open oil' })
      vim.keymap.set('n', '<leader>-', oil.toggle_float, { desc = 'Toggle oil floating window' })
    end,
  },
}
