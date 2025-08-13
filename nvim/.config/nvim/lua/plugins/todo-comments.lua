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

      vim.keymap.set('n', ']t', todo.jump_next, { desc = "Next todo comment" })
      vim.keymap.set('n', '[t', todo.jump_prev, { desc = "Previous todo comment" })
    end
  },
}
