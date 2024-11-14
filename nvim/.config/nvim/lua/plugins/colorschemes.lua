-- Colorschemes
return {
  -- Rose Pine
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        transparent = true,
        variant = 'main',
      }
    end,
  },
  
  -- Cyberdream
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('cyberdream').setup {
        transparent = true,
        italic_comments = false,
        terminal_colors = false,
        extensions = {
          telescope = false,
          fzflua = false,
          gitsigns = true,
          lazy = true,
          cmp = true,
        },
      }
    end,
  },
}
