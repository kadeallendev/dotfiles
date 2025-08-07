local dap = require 'dap'
local ui = require 'dapui'

-- Breakpoints
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dB', '<CMD>lua require"dap".set_breakpoint(vim.fn.input "[Condition] > ")<CR>',
  { desc = 'Conditional Breakpoint' })

-- Eval under cursor
vim.keymap.set('n', '<leader>de', function()
  require('dapui').eval(nil, { enter = true })
end, { desc = 'Eval under cursor' })

-- Toggle Repl
vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Debug: Toggle Repl' })

vim.keymap.set('n', '<F1>', dap.continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F2>', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F3>', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F4>', dap.step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<F5>', dap.step_back, { desc = 'Debug: Step Back' })
vim.keymap.set('n', '<F11>', dap.restart, { desc = 'Debug: Restart' })
vim.keymap.set('n', '<F12>', dap.terminate, { desc = 'Debug: Terminate' })
