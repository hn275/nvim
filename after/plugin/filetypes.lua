local f = {
	{
		file_type = { "*.typ" },
		fn = function()
			vim.cmd("set ft=typst")
		end,
	},
	{
		file_type = { "*.prisma" },
		fn = function()
			vim.cmd([[set ft=prisma]])
		end,
	},
	{
		file_type = { "*.astro" },
		fn = function()
			vim.cmd([[set ft=astro]])
		end,
	},
}

for _, v in pairs(f) do
	vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufEnter" }, {
		group = vim.api.nvim_create_augroup("FileTypeSet", { clear = false }),
		pattern = v.file_type,
		callback = v.fn,
	})
end
