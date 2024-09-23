local data = assert(vim.fn.stdpath 'data') --[[@as string]]

require('telescope').setup {
  pickers = {
    buffers = {
      show_all_buffers = true,
      mappings = {
        i = { ['<C-d>'] = 'delete_buffer' },
      },
    },
  },
  extensions = {
    fzf = {},
    wrap_results = true,
    history = {
      path = vim.fs.joinpath(data, 'telescope_history.sqlite3'),
      limit = 100,
    },
  },
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'smart_history')
pcall(require('telescope').load_extension, 'ui-select')

local builtin = require 'telescope.builtin'

local find_files_from_project_git_root = function()
  local function is_git_repo()
    vim.fn.system 'git rev-parse --is-inside-work-tree'
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir('.git', '.;')
    return vim.fn.fnamemodify(dot_git_path, ':h')
  end
  local opts = {}
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end
  require('telescope.builtin').find_files(opts)
end
-- NOTE: Replaced by fzf-lua
-- -- Search through files from git root
-- vim.keymap.set('n', '<leader>.', find_files_from_project_git_root, { desc = 'Find in project' })
--
-- -- Search buffers
-- vim.keymap.set('n', '<leader>,', builtin.buffers, { desc = 'Buffers' })

-- Find all files
vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files { hidden = true }
end, { desc = 'Find all files' })

-- Live grep search
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })

-- Search command history
vim.keymap.set('n', '<leader>fc', builtin.command_history, { desc = 'Command history' })
vim.keymap.set('n', '<leader>fC', builtin.commands, { desc = 'Command' })

-- -- Search symbols
-- vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, { desc = 'LSP: Search document symbols' })
-- vim.keymap.set('n', '<leader>lS', builtin.lsp_workspace_symbols, { desc = 'LSP: Search workspace symbols' })
--
-- -- Search file diagnostics
-- vim.keymap.set('n', '<leader>ld', builtin.diagnostics, { desc = 'LSP: Search file diagnostics', buffer = 0 })

vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>fn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = 'Find config files' })
