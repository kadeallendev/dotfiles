return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'VeryLazy',
    config = function()
      require 'config.copilot'
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    event = 'VeryLazy',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim' },
    },
    config = true,
  },
}
