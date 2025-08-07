vim.cmd [[
	syntax clear
	syntax match pgpHeader /-----BEGIN PGP MESSAGE-----/
	syntax match pgpHeader /-----END PGP MESSAGE-----/
	syntax match pgpHeader /-----BEGIN PGP PUBLIC KEY BLOCK-----/
	syntax match pgpHeader /-----END PGP PUBLIC KEY BLOCK-----/
	syntax match pgpHeader /-----BEGIN PGP PRIVATE KEY BLOCK-----/
	syntax match pgpHeader /-----END PGP PRIVATE KEY BLOCK-----/
	syntax match pgpVersion /Version:/
	syntax match pgpComment /Comment:/
]]

vim.api.nvim_set_hl(0, "pgpHeader", { link = "Special", default = true })
vim.api.nvim_set_hl(0, "pgpVersion", { link = "Statement", default = true })
vim.api.nvim_set_hl(0, "pgpComment", { link = "Comment", default = true })

vim.b.current_syntax = "pgp"
