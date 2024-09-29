local fzf = require 'fzf-lua'
local actions = require 'fzf-lua.actions'
-- TODO: Add profile
fzf.setup {
  keymap = {
    builtin = {
      ['<C-d>'] = 'preview-page-down',
      ['<C-u>'] = 'preview-page-up',
      ['<C-e>'] = 'preview-down',
      ['<C-y>'] = 'preview-up',
    },
    fzf = {
      ['CTRL-Q'] = 'select-all+accept',
    },
  },
  fzf_colors = true,
  winopts = {
    height = 0.7, -- Default 0.85
    width = 0.7, -- Default 0.80
    border = 'single',
    preview = {
      horizontal = 'right:55%', -- Default right:60%
      title_pos = 'left', -- Default center
    },
  },
  -- PICKERS --

  -- Default options
  default = {
    git_icons = false, -- Don't show git status
  },
  -- Files picker is used for finding all files in current directory
  files = {
    formatter = 'path.filename_first', -- Show filename first, e.g. "fzf-lua/previewer/fzf.lua" => "fzf.lua previewer/fzf-lua"
    cwd_prompt_shorten_len = 20, -- Shorten the cwd prompt at 20 letters
    cwd_prompt_shorten_val = 3, -- Shorten each folder to 3 characters
  },
  grep = {
    rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e',
    winopts = {
      width = 0.8,
      height = 0.75,
      preview = {
        horizontal = 'right:50%',
      },
    },
  },
  git = {
    status = {
      -- Actions to stage and unstage with <C-y> and <C-s>
      -- NOTE: for some reason this doesn't work
      -- actions = {
      --   ['right'] = false,
      --   ['left'] = false,
      --   ['ctrl+x'] = { fn = actions.git_reset, reload = true },
      --   ['ctrl+y'] = { fn = actions.git_stage_unstage, reload = true },
      --   ['ctrl+s'] = { fn = actions.git_stage_unstage, reload = true },
      -- },
    },
  },
  lsp = {
    code_actions = {
      previewer = 'codeaction_native',
    },
  },
  diagnostics = {
    previewer = false,
  },
  keymaps = {
    winopts = {
      preview = {
        layout = 'horizontal',
        horizontal = 'right:40%',
      },
    },
  },
}

fzf.register_ui_select()

--- FILES ---

-- Find all files
vim.keymap.set('n', '<leader>/f', function()
  fzf.files()
end, { desc = 'Search files' })
vim.keymap.set('n', '<leader>.', function()
  fzf.files()
end, { desc = 'Search files' })

-- Find buffers
vim.keymap.set('n', '<leader>,', function()
  fzf.buffers()
end, { desc = 'Search buffers' })

-- Search git files
-- NOTE: Kinda pointless, just use files instead
-- vim.keymap.set('n', '<leader>.', function()
--   fzf.git_files()
-- end, { desc = 'Search git files' })

--- IN-FILE SEARCHING ---

-- Live grep
vim.keymap.set('n', '<leader>/g', function()
  fzf.live_grep()
end, { desc = 'Live grep search' })

--- NEOVIM SEARCHING ---

-- Commands
vim.keymap.set('n', '<leader>/c', function()
  fzf.commands()
end, { desc = 'Search commands' })

-- Command history
vim.keymap.set('n', '<leader>/C', function()
  fzf.command_history()
end, { desc = 'Search command history' })

-- Resume last search
vim.keymap.set('n', '<leader>/r', function()
  fzf.resume()
end, { desc = 'Resume search' })

-- Search keymaps
vim.keymap.set('n', '<leader>/k', function()
  fzf.keymaps()
end, { desc = 'Search keymaps' })

-- Quickfix list
vim.keymap.set('n', '<leader>/q', function()
  fzf.quickfix()
end, { desc = 'Search quickfix list' })

-- Diagnostics
vim.keymap.set('n', '<leader>/d', function()
  fzf.diagnostics_document()
end, { desc = 'Search document diagnostics' })
vim.keymap.set('n', '<leader>/D', function()
  fzf.diagnostics_workspace()
end, { desc = 'Search workspace diagnostics' })

--- GIT ---

-- Git status
vim.keymap.set('n', '<leader>g/', function()
  fzf.git_status()
end, { desc = 'Fzf Git status' })

-- Git commits
vim.keymap.set('n', '<leader>gc', function()
  fzf.git_commits()
end, { desc = 'Fzf Git commits' })

--- AIDS ---

-- Complete path
vim.keymap.set('i', '<C-x><C-p>', function()
  fzf.complete_path()
end, { silent = true, desc = 'Fuzzy complete path' })

-- Complete file
vim.keymap.set('i', '<C-x><C-f>', function()
  fzf.complete_file {
    cmd = 'rg --files',
    winopts = { preview = { hidden = 'nohidden' } },
  }
end, { silent = true, desc = 'Fuzzy complete file' })

-- vim.keymap.set('n', '<leader>/', function()
--   fzf.files()
-- end, { desc = '' })
