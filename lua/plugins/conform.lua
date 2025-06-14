return {
	"stevearc/conform.nvim",
	config = function()
		local format_on_save = true
		local conform = require("conform")

		local format_on_save = nil

		local fmt_on = function()
			format_on_save = vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				pattern = "*.*",
				callback = function(args)
					conform.format({ bufnr = args.buf })
				end,
			})
		end

		local fmt_on_save = function()
			if format_on_save == nil then
				fmt_on()
				print("format_on_save ON")
			else
				vim.api.nvim_del_autocmd(format_on_save)
				format_on_save = nil
				print("format_on_save OFF")
			end
		end

		fmt_on()

		-- fmt_on()
		vim.api.nvim_create_user_command("AutoFmt", fmt_on_save, {})

		local options = {
			formatters_by_ft = {
				lua = { "stylua" },
				css = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				python = { "black" },
				cpp = { "clang-format" },
				go = { "gofmt", "goimports" },
				typst = { "typstyle" },
				sh = { "shfmt" },
			},

			formatters = {
				clang_format = {
					extra_args = {
						"-style=file:" .. vim.fn.expand("~/.clang-format"),
					},
				},
			},
		}

		require("conform").setup(options)
	end,
}
