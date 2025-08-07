--- Perform PGP encryption and decryption on the current buffer
---@class Encryption
local M = {}

--- Checks if the current buffer is a real file on disk
---@return boolean # |TRUE| if the buffer is a real file on disk, |FALSE| otherwise
M.is_real_file = function()
  local filename = vim.api.nvim_buf_get_name(0)
  return filename ~= '' and vim.fn.filereadable(filename) == 1
end

--- Checks if the current buffer is PGP encrypted
---@return boolean # |TRUE| if the buffer is PGP encrypted, |FALSE| otherwise
M.is_encrypted = function()
  local lines = vim.api.nvim_buf_get_lines(0, 0, 10, false)
  for _, line in ipairs(lines) do
    if line:match '-----BEGIN PGP MESSAGE-----' then
      return true
    end
  end

  return false
end

--- Encrypt the current buffer with PGP for $KEYID
--- Only encrypts if it is a real file and not already encrypted.
--- Saves the original filetype and writes to disk.
---
--- Runs:
--- ```
--- gpg --encrypt --recipient $KEYID
--- ```
M.encrypt_buffer = function()
  -- Ensure buffer is a file on disk and is not encrypted already
  if not M.is_real_file() then
    vim.notify('Not a file on disk', vim.log.levels.WARN)
    return
  elseif M.is_encrypted() then
    vim.notify('Already Encrypted', vim.log.levels.INFO)
    return
  end

  -- Get the recipient
  local recipient = '--default-recipient-self'
  local keyid = vim.env.KEYID
  if keyid then
    recipient = '--recipient ' .. keyid
  end

  vim.cmd(string.format('%%! gpg --encrypt --armor %s', recipient))
  vim.b.og_filetype = vim.bo.filetype
  vim.bo.filetype = 'pgp'
  vim.cmd.write()
end

--- Decrypt the current PGP encrypted buffer
--- Only decrypts if buffer is a real file and is PGP encrypted.
--- Restores the original filetype and saves to disk.
---
--- Runs:
--- ```
--- gpg --quiet --decrypt
--- ```
M.decrypt_buffer = function()
  -- Ensure buffer is a file on disk and is already encrypted
  if not M.is_real_file() then
    vim.notify('Not a file on disk', vim.log.levels.WARN)
    return
  elseif not M.is_encrypted() then
    vim.notify('Not PGP encrypted', vim.log.levels.INFO)
    return
  end

  vim.cmd '%! gpg --quiet --decrypt'
  vim.bo.filetype = vim.b.og_filetype
  vim.cmd.write()
end


-- Keymaps in plugin/keymaps.lua
-- Commands in plugin/commands.lua

return M
