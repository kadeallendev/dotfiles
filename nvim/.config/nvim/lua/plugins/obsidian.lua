-- Obsidian integration
if vim.loop.os_uname().sysname == "Linux" then
	return {
		{
			'epwalsh/obsidian.nvim',
			version = '*',
			dependencies = {
				'nvim-lua/plenary.nvim',
			},
			config = function()
					require 'config.obsidian'
			end,
		},
	}
end

return {}
