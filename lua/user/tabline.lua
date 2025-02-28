function _G.custom_tabline()
	local s = ""
	local current_tab = vim.fn.tabpagenr()
	local total_tabs = vim.fn.tabpagenr("$")

	for i = 1, total_tabs do
		-- Select the highlighting
		if i == current_tab then
			s = s .. "%#TabLineSel#"
		else
			s = s .. "%#TabLine#"
		end

		-- Display the tab number
		s = s .. " " .. i .. " "

		-- Get the window number and buffer list for this tab
		local win = vim.fn.tabpagewinnr(i)
		local buf = vim.fn.tabpagebuflist(i)[win]

		-- Get the buffer name
		local bufname = vim.fn.bufname(buf)

		-- Format the buffer name
		if bufname == "" then
			bufname = "[No Name]"
		else
			bufname = "/" .. vim.fn.fnamemodify(bufname, ":.")
		end

		s = s .. bufname .. " "
	end

	-- Fill the rest of the tabline
	s = s .. "%#TabLineFill#%T"

	return s
end

vim.opt.tabline = "%!v:lua.custom_tabline()"
