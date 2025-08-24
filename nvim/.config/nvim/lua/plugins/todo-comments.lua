-- Todo comment highlighting
return {
  {
    'folke/todo-comments.nvim',
    event = 'BufEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local todo = require('todo-comments')
      todo.setup({
        signs = false,
        highlight = {
          multiline_pattern = '^|.',
        },
      })

      -- Use yellow for TODO
      vim.api.nvim_set_hl(0, 'TodoFGTODO', { fg = 'NvimLightYellow' })
      vim.api.nvim_set_hl(0, 'TodoBGTODO', { bg = 'NvimLightYellow', fg = "NvimDarkGrey1" })

      vim.keymap.set('n', ']t', todo.jump_next, { desc = "Next todo comment" })
      vim.keymap.set('n', '[t', todo.jump_prev, { desc = "Previous todo comment" })
    end
  },
}
