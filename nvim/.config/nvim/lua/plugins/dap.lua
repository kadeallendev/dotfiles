-- Debugger
return {
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    -- event = 'VeryLazy',
    dependencies = {
      -- Visual
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',

      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',

      -- Language Debuggers here:
      'leoluz/nvim-dap-go',
    },
    -- event = 'VeryLazy',
    config = function()
      local dap = require 'dap'
      local ui = require 'dapui'

      require('dapui').setup()

      require('dap-go').setup()

      require 'config.dap'

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
