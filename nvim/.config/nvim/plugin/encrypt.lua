local M = {}

M.is_real_file = function()
  local filename = vim.api.nvim_buf_get_name(0)
  return filename ~= "" and vim.fn.filereadable(filename) == 1
end

--- Checks if the current buffer is GPG encrypted
---@return boolean True if GPG encrypted, false otherwise
M.is_encrypted = function()
  local lines = vim.api.nvim_buf_get_lines(0, 0, 10, false)
  for _, line in ipairs(lines) do
    if line:match("-----BEGIN PGP MESSAGE-----") then
      return true
    end
  end

  return false
end

--- Encrypt the current buffer with GPG for $KEYID
--- Only encrypts if it is a real file and not already encrypted.
--- Saves the original filetype and writes to disk.
---
--- Runs:
--- ```
--- gpg --encrypt --recipient $KEYID
--- ```
M.encrypt_buffer = function()
  if not M.is_real_file() then
    vim.notify("Not a file on disk", vim.log.levels.WARN)
    return
  elseif M.is_encrypted() then
    vim.notify("Already Encrypted", vim.log.levels.INFO)
    return
  end

  vim.cmd "%! gpg --encrypt --recipient $KEYID"
  vim.b.og_filetype = vim.bo.filetype
  vim.bo.filetype = "gpg"
  vim.cmd.write()
end

--- Decrypt the current GPG encrypted buffer
--- Only decrypts if buffer is a real file and is GPG encrypted.
--- Restores the original filetype and saves to disk.
---
--- Runs:
--- ```
--- gpg --quiet --decrypt
--- ```
M.decrypt_buffer = function()
  if not M.is_real_file() then
    vim.notify("Not a file on disk", vim.log.levels.WARN)
    return
  elseif not M.is_encrypted() then
    vim.notify("Not GPG encrypted", vim.log.levels.INFO)
    return
  end

  vim.cmd "%! gpg --quiet --decrypt"
  vim.bo.filetype = vim.b.og_filetype
  vim.cmd.write()
end

-- Set keymaps
vim.keymap.set('n', '<leader>e', M.encrypt_buffer, { desc = "GPG encrypt buffer" })
vim.keymap.set('n', '<leader>E', M.decrypt_buffer, { desc = "GPG decrypt buffer" })

-- Create commands
vim.api.nvim_create_user_command('Enc', M.encrypt_buffer, { desc = "GPG encrypt buffer" })
vim.api.nvim_create_user_command('Dec', M.decrypt_buffer, { desc = "GPG decrypt buffer" })

return M
