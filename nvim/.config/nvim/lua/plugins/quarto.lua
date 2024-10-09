return {
  {
    'quarto-dev/quarto-nvim',
    ft = { 'quarto', 'markdown' },
    dependencies = {
      'jmbuhr/otter.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('quarto').setup {
        lspFeatures = {
          languages = { 'python' },
          chunks = 'all',
          diagnostics = {
            enabled = true,
            triggers = { 'BufWritePost' },
          },
          completion = {
            enabled = true,
          },
        },
        -- keymap = {
        -- 	hover = "K",
        -- 	definition = "gd",
        -- 	rename = "<leader>lr",
        -- 	references = "gr",
        -- 	format = "<leader>lf"
        -- },
        codeRunner = {
          enabled = true,
          default_method = 'molten',
        },
      }

      local runner = require 'quarto.runner'
      vim.keymap.set('n', '<leader>pc', runner.run_cell, { desc = 'Quarto run cell', silent = true })
      vim.keymap.set('n', '<leader>pr', runner.run_all, { desc = 'Quarto run all', silent = true })
      vim.keymap.set('n', '<leader>pa', runner.run_above, { desc = 'Quarto run cell and above', silent = true })

      vim.api.nvim_create_autocmd({ 'FileType' }, {
        pattern = { '.md', '.py' },
        callback = function()
          require('quarto').activate()
        end,
      })
    end,
  },
}
