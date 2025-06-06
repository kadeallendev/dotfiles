-- Better file navigation
return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = 'Add file to harpoon list' })

      -- Edit with harpoon default menu
      vim.keymap.set('n', '<leader>he', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Edit harpoon list' })

      -- Select files
      for _, idx in ipairs { 1, 2, 3, 4, 5 } do
        -- Primary (Leader)
        vim.keymap.set('n', string.format('<leader>%d', idx), function()
          harpoon:list():select(idx)
        end)

        -- Secondary (CTRL)
        vim.keymap.set('n', string.format('<C-%d>', idx), function()
          harpoon:list():select(idx + 5)
        end)
      end
    end,
  },
}
