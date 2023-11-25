-- Start in insert for vim fugitive commit
vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Start in insert mode for a Git fugitive commit",
	pattern = { "gitcommit" },
	group = vim.api.nvim_create_augroup("GITFUGITIVE", { clear = true }),
	callback = function()
		vim.cmd.startinsert()
	end,
})
