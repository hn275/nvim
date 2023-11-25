require("formatter").setup({
	filetype = {
		typescriptreact = { require("formatter.filetypes.javascript").prettier },
		typescript = { require("formatter.filetypes.javascript").prettier },
		javascript = { require("formatter.filetypes.javascript").prettier },
		javascriptreact = { require("formatter.filetypes.javascript").prettier },
		svelte = { require("formatter.filetypes.javascript").prettier },
		go = { require("formatter.filetypes.go").gofmt },
		rust = { require("formatter.filetypes.rust").rustfmt },
		lua = { require("formatter.filetypes.lua").stylua },
	},
})

local autocmd_id = vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "*.*",
	callback = function()
		vim.cmd("FormatWriteLock")
	end,
})

local fmt_on_save = function()
	if autocmd_id == nil then
		autocmd_id = vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			pattern = "*.*",
			callback = function()
				vim.lsp.buf.format()
				vim.cmd("FormatWrite")
			end,
		})
		print("AutoFmt on")
	else
		vim.api.nvim_del_autocmd(autocmd_id)
		autocmd_id = nil
		print("AutoFmt off")
	end
end

vim.api.nvim_create_user_command("AutoFmt", fmt_on_save, {})
