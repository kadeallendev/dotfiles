-- Browse internet from neovim
return {
  {
    'chrishrb/gx.nvim',
    keys = { { 'gx', '<cmd>Browse<cr>', mode = { 'n', 'x' } } },
    cmd = { 'Browse' },
    init = function()
      vim.g.newrw_nogx = 1
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true,
    submodules = false,
  },
}
