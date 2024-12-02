-- Start the GH actions language server

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'github-actions-workflow',
  callback = function()
    vim.lsp.start {
      name = 'gh-actions-lsp',
      filetypes = { 'github-actions-workflow' },
      cmd = { 'npx', '@strozw/github-actions-languageserver', '--stdio' },
      root_dir = vim.fn.getcwd(),
      init_options = {},
    }
  end,
})

vim.cmd 'autocmd BufRead,BufNewFile *.github/workflows/*.yaml set filetype=github-actions-workflow'
vim.cmd 'autocmd BufRead,BufNewFile *.github/workflows/*.yml set filetype=github-actions-workflow'
vim.cmd 'autocmd BufRead,BufNewFile *.github/actions/*.yaml set filetype=github-actions-workflow'
vim.cmd 'autocmd BufRead,BufNewFile *.github/actions/*.yml set filetype=github-actions-workflow'

vim.treesitter.language.register('yaml', 'github-actions-workflow')
