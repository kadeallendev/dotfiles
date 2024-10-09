return {
  {
    'benlubas/molten-nvim',
    version = '^1.0.0',
    build = ':UpdateRemotePlugins',
    init = function()
      vim.g.molten_auto_open_output = false
      vim.g.molten_image_provider = 'wezterm'
      vim.g.molten_output_win_max_height = 20
      vim.g.python3_host_prog = vim.fn.expand '~/.virtualenvs/neovim/bin/python3'
    end,
    config = function()
      vim.keymap.set('n', '<leader>pi', function()
        local venv = os.getenv 'VIRTUAL_ENV'
        if venv ~= nil then
          venv = string.match(venv, '/.+/(.+)')
          vim.cmd(('MoltenInit %s'):format(venv))
        else
          vim.cmd 'MoltenInit python3'
        end
      end, { desc = 'Initialize Molten for python3', silent = true })

      -- vim.keymap.set('n', '<leader>meo', ':MoltenEvaluateOperator<CR>', { desc = 'Molten evaluate operator', silent = true })
      vim.keymap.set('n', '<leader>po', ':noautocmd MoltenEnterOutput<CR>', { desc = 'Molten open output window', silent = true })
      vim.keymap.set('n', '<leader>ph', ':MoltenHideOutput<CR>', { desc = 'Molten hiden output', silent = true })
      -- vim.keymap.set('n', '<leader>pe', ':MoltenReevaluateCell<CR>', { desc = 'Molten reevaluate cell', silent = true })
      vim.keymap.set('v', '<leader>pv', ':MoltenEvaluateVisual<CR>', { desc = 'Molten evaluate visual', silent = true })
      vim.keymap.set('n', '<leader>pl', ':MoltenEvaluateLine<CR>', { desc = 'Molten evaluate line', silent = true })
    end,
  },
}
