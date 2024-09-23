local harpoon = require 'harpoon'
harpoon:setup()

-- Add file
vim.keymap.set('n', '<leader>ha', function()
  harpoon:list():add()
end, { desc = 'Add file to harpoon list' })

-- Edit with harpoon default menu
vim.keymap.set('n', '<leader>he', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Edit harpoon list' })

-- Select files
for _, idx in ipairs { 1, 2, 3, 4, 5 } do
  vim.keymap.set('n', string.format('<leader>%d', idx), function()
    harpoon:list():select(idx)
  end)
end
