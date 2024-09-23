-- Auto xml-style tags
return {
  {
    'windwp/nvim-ts-autotag',
    requries = {
      'nvim-treesitter/nvim-treesitter',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    ft = '{html,xml,js,ts,jsx,tsx}',
    config = function()
      require('nvim-ts-autotag').setup {
        enable = true,
        filetypes = {
          'html',
          'xml',
          'js',
          'ts',
          'tsx',
          'jsx',
        },
      }
    end,
  },
}
