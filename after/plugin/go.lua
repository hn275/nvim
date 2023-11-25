vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "go" },
	group = vim.api.nvim_create_augroup("if-err", { clear = true }),
	callback = function()
		vim.keymap.set("i", "<C-e>", "err != nil {\n}<Esc>O", { noremap = true, silent = true })
	end,
})

local ok, _ = pcall(require, "go")
if not ok then
	return
end

local format_sync_grp = vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("GoFormat", { clear = true }),
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
})
