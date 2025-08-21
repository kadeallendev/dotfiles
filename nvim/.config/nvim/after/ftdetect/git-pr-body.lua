vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "/tmp/*.md",
	callback = function(ev)
		local filename = vim.fn.expand("%:t")
		if filename:match("^%d+%.md$") then
			vim.bo[ev.buf].filetype = "markdown.git-pr-body"
		end
	end
})
