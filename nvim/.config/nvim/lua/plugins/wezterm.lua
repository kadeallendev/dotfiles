-- Integrations with WezTerm

-- Only use if on unix system
if vim.loop.os_uname().sysname == "Linux" then
	return {
  {
    'willothy/wezterm.nvim',
    config = true,
  },
}
end

return {}
