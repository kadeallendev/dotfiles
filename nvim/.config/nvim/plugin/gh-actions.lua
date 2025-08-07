-- Filetype recognition
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  desc = "GitHub Actions",
  pattern = { "*.github/workflows/*.yaml", "*.github/workflows/*.yml", "*.github/actions/*.yaml", "*.github/actions/*.yml" },
  callback = function()
    vim.bo.filetype = "github-action"
  end
})

-- Register yaml treesitter for github actions
vim.treesitter.language.register('yaml', 'github-action')
