-- Todo comment highlighting
return {
  {
    'folke/todo-comments.nvim',
    event = "BufEnter",
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      signs = false,
    },
  },
}
