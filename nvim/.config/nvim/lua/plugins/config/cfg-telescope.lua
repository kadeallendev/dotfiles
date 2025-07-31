require('telescope').setup {
  pickers = {
    buffers = {
      show_all_buffers = true,
      mappings = {
        i = { ['<C-d>'] = 'delete_buffer' },
      },
    },
  },
}
