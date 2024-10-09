return {
  {
    'nvim-java/nvim-java',
    ft = 'java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-refactor',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
    },
    config = function()
      local function k(mode, key, cmd, d)
        vim.keymap.set(mode, key, cmd, { desc = d })
      end

      k('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
      k('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
      k('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
      k('n', 'gI', function()
        require('fzf-lua').lsp_implementations()
      end, 'Search implementations')
      k('n', 'gr', function()
        require('fzf-lua').lsp_references()
      end, 'Search references')
      k('n', '<leader>la', vim.lsp.buf.code_action, 'Code action')
      k('n', '<leader>lr', vim.lsp.buf.rename, 'Rename symbol')
    end,
  },
}
