local set = vim.opt_local

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', {}),
  callback = function()
    set.number = false
    set.relativenumber = false
    set.scrolloff = 0
  end,
})

vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')
