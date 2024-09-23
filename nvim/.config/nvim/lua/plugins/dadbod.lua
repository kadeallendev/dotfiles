-- Database UI
return {
  'tpope/vim-dadbod',
  dependencies = {
    'kristijanhusak/vim-dadbod-completion',
    'kristijanhusak/vim-dadbod-ui',
  },
  config = function()
    -- Add completion support
    require('cmp').setup.filetype({ 'sql' }, {
      sources = {
        { name = 'vim-dadbod-completion' },
        { name = 'buffer' },
      },
    })
  end,
}

-- For example configs
-- - https://github.com/xero/dotfiles/blob/main/neovim/.config/nvim/lua/plugins/dadbod.lua
