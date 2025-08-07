vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.pgp", "*.gpg", "*.asc" },
	callback = function()
		-- Check if file contains PGP headers
		local lines = vim.api.nvim_buf_get_lines(0, 0, 10, false)
		for _, line in ipairs(lines) do
			if line:match('-----BEGIN PGP MESSAGE-----') or
					line:match('-----BEGIN PGP PUBLIC KEY BLOCK-----') or
					line:match('-----BEGIN PGP PRIVATE KEY BLOCK-----') then
				vim.bo.filetype = 'pgp'
				break
			end
		end
	end
})
