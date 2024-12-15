return {
  {
    'ziontee113/icon-picker.nvim',
    event = 'VeryLazy',
    config = function()
      require('icon-picker').setup { disable_legacy_commands = true }
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<leader>/e', '<CMD>IconPickerNormal<CR>', { desc = 'Search emojis', noremap = true, silent = true })
      vim.keymap.set('i', '<C-e>', '<CMD>IconPickerInsert<CR>', opts)
    end,
  },
}
