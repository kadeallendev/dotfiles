local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local modes = { 'n', 'v' }

-- Open files
keymap(modes, '<leader>.', '<CMD>lua require("vscode").action("workbench.action.quickOpen")<CR>', opts)

-- Commands
keymap(modes, '<leader>:', '<CMD>lua require("vscode").action("workbench.action.showCommands")<CR>', opts)

-- Code actions
keymap(modes, '<leader>la', '<CMD>lua require("vscode").action("editor.action.quickFix")<CR>', opts)

-- View diagnostics
keymap(modes, '<leader>ld', '<CMD>lua require("vscode").action("workbench.actions.view.problems")<CR>', opts)

-- Format document
keymap(modes, '<leader>lf', '<CMD>lua require("vscode").action("editor.action.formatDocument")<CR>', opts)

-- Harpoon
-- Add
keymap(modes, '<leader>ha', '<CMD>lua require("vscode").action("vscode-harpoon.addEditor")<CR>', opts)
keymap(modes, '<leader>ha', "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>", opts)
keymap(modes, '<leader>ho', "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>", opts)
keymap(modes, '<leader>he', "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>", opts)
keymap(modes, '<leader>1', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>", opts)
keymap(modes, '<leader>2', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>", opts)
keymap(modes, '<leader>3', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>", opts)
keymap(modes, '<leader>4', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>", opts)
keymap(modes, '<leader>5', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>", opts)
keymap(modes, '<leader>6', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>", opts)
keymap(modes, '<leader>7', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>", opts)
keymap(modes, '<leader>8', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>", opts)
keymap(modes, '<leader>9', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>", opts)

-- Project Manager
keymap(modes, '<leader>pa', "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>", opts)
keymap(modes, '<leader>po', "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>", opts)
keymap(modes, '<leader>pe', "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>", opts)
