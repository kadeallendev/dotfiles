local cmd = vim.api.nvim_create_user_command
-- Restart syntax highlighting
cmd('FixSyntax', 'syntax sync fromstart', { desc = 'reload syntax highlighting' })

-- Reload special git registers
cmd('Rreg', function()
  vim.cmd 'do User FugitiveChanged'
end, { desc = 'Reset git registers' })

-- Print full path to current buffer
cmd('Path', function()
  local path = vim.fn.expand '%:p'
  print(path)
end, { desc = 'Print full path of current buffer' })

-- Encrypt module
local encrypt = require 'kade.encrypt'
cmd('Enc', encrypt.encrypt_buffer, { desc = 'GPG encrypt buffer' })
cmd('Dec', encrypt.decrypt_buffer, { desc = 'GPG decrypt buffer' })

-- Statusline toggle
cmd('Tstatus', require('kade.statusline-toggle').toggle, { desc = 'Toggle custom statusline' })

-- URL Encode/decode
local url_module = require 'kade.url-encoding'
cmd('UrlEncode', function(opts)
  if opts.range > 0 then
    url_module.encode_selection()
  else
    url_module.encode_line()
  end
end, { desc = 'URL encode current line', range = true })
cmd('UrlDecode', function(opts)
  if opts.range > 0 then
    url_module.decode_selection()
  else
    url_module.encode_selection()
  end
end, { desc = 'URL decode current line', range = true })
