require('copilot').setup {
  panel = {
    layout = {
      position = 'right',
      ratio = 0.3,
    },
  },
  suggestion = {
    auto_trigger = false,
  },
  filetypes = {
    ['*'] = false, -- disable all
    csharp = true,
    yaml = true,
    ['github-actions-workflow'] = true,
    ps1 = true,
  },
}

vim.keymap.set('n', '<leader>cs', '<cmd>Copilot panel<cr>', { desc = 'Open Copilot suggestions', noremap = true, silent = true })

-- Chat
local chat = require 'CopilotChat'
chat.setup {
  panel = {
    layout = {
      position = 'right',
      ratio = 0.3,
    },
  },
  model = 'gpt-4',
}

-- Open chat
vim.keymap.set('n', '<leader>cp', function()
  chat.toggle()
end, { noremap = true, silent = true, desc = 'Open Copilot chat' })

-- Reset chat
vim.keymap.set('n', '<leader>cr', function()
  chat.reset()
end, { noremap = true, silent = true, desc = 'Rest Copilot chat' })
