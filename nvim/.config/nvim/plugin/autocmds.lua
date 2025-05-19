--------------------------------------------------------
-- Inserts the current git branch into the 'b' register.
-- Defaults to 'main' if not in git repo.
--------------------------------------------------------
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    local function get_git_branch()
      -- Check if git command exists
      local git_exists = vim.fn.executable 'git'
      if git_exists == 0 then
        return 'main'
      end

      -- Check if inside git repo
      local success, is_git_output = pcall(function()
        return vim.fn.system 'git rev-parse --is-inside-work-tree 2>/dev/null'
      end)
      if not (success and is_git_output:match 'true') then
        return 'main'
      end

      -- Get branch name safely
      local branch_success, branch = pcall(function()
        return vim.fn.trim(vim.fn.system 'git branch --show-current 2>/dev/null')
      end)
      if not branch_success or branch == '' then
        return 'main'
      end

      return branch
    end

    local branch = get_git_branch()
    if branch then
      vim.fn.setreg('b', branch)
    end
  end,
})
