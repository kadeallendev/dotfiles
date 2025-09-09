-- Better file navigation
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    -- Add to harpoon list
    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = 'Add file to harpoon list' })

    -- Edit with harpoon default menu
    vim.keymap.set('n', '<leader>he', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Edit harpoon list' })

    local keymap = function(format, key, num)
      vim.keymap.set('n', string.format(format, key), function()
        harpoon:list():select(num)
      end)
    end
    -- Select files
    for idx, char in ipairs { '!', '@', '#', '$', '%' } do
      -- Primary (numbers)
      keymap('<leader>%d', idx, idx)
      -- Secondary (symbols)
      keymap('<leader>%s', char, idx + 5)
      -- I want both symbols and 6-9A
      keymap('<leader>%d', idx + 5, idx + 5)
    end
  end,
}
