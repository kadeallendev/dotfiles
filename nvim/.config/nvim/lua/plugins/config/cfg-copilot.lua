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

vim.keymap.set('n', '<leader>cs', '<cmd>Copilot panel<cr>', { desc = 'Open Copilot suggestions', silent = true })

-- Chat
local chat = require 'CopilotChat'
chat.setup {
  window = {
    layout = 'vertical',
    width = 0.4,
  },
  model = 'claude-3.7-sonnet',
  mappings = {
    accept_nearest_diff = {
      normal = '<C-<CR>>'
    },
    reset = {
      normal = '<leader>cr',
      callback = function()
        chat.reset()
      end,
    },
  },
}

-- Open chat
vim.keymap.set('n', '<leader>cp', function()
  chat.toggle()
end, { silent = true, desc = 'Open Copilot chat' })
