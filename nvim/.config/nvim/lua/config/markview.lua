local markview = require 'markview'
markview.setup {}

-- TODO: check if theyre enabled first

local function toggle_markdown()
  vim.cmd 'Markview toggle'
  local nabla = require 'nabla'
  nabla.toggle_virt()
end

-- vim.keymap.set('n', '<leader>m', '<CMD>Markview toggle<CR>', { desc = 'Markview toggle' })
vim.keymap.set('n', '<leader>m', toggle_markdown, { desc = 'Toggle markdown' })
