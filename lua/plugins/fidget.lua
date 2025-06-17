return {
	"j-hui/fidget.nvim",
	opts = {},
	event = "VeryLazy",
	config = function(_, opts)
		require("fidget").setup(opts)
		local progress_notifications = {}

		-- Override the default LSP progress handler
		vim.lsp.handlers["$/progress"] = function(_, result, ctx)
			local client = vim.lsp.get_client_by_id(ctx.client_id)
			local value = result.value
			local token = result.token

			if value.kind == "begin" then
				local notif = vim.notify(value.title or "LSP Operation", "info", {
					title = client.name,
					timeout = false, -- Keep open until done
				})
				progress_notifications[token] = notif
			elseif value.kind == "end" then
				local notif = progress_notifications[token]
				if notif then
					-- Replace the existing notification
					vim.notify("Completed: " .. (value.title or "LSP Operation"), "info", {
						title = client.name,
						timeout = 2000,
						replace = notif,
					})
					progress_notifications[token] = nil
				end
			end
		end
	end,
}
