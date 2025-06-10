local autocmd_id = nil

local fmt_on = function()
	autocmd_id = vim.api.nvim_create_autocmd({ "BufWritePre" }, {
		pattern = "*.*",
		callback = function()
			vim.lsp.buf.format({
				async = false,
				quiet = false,
			})
		end,
	})
end

local fmt_on_save = function()
	if autocmd_id == nil then
		fmt_on()
		print("AutoFmt on")
	else
		vim.api.nvim_del_autocmd(autocmd_id)
		autocmd_id = nil
		print("AutoFmt off")
	end
end

fmt_on()
vim.api.nvim_create_user_command("AutoFmt", fmt_on_save, {})
