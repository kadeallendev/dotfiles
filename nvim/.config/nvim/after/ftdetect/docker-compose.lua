-------------------------------------
-- Detect docker-compose.yml filetype
-------------------------------------
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
	desc = "Detect docker compose filetype",
	pattern = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
	callback = function()
		vim.bo.filetype = "yaml.docker-compose"
	end
})
