local function telescope_builtin_commands()
	local telescope = require("telescope.builtin")
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local commands = {}
	for key, _ in pairs(telescope) do
		table.insert(commands, tostring(key))
	end

	pickers
		.new({}, {
			prompt_title = "Telescope Builtin Commands",
			finder = finders.new_table({
				results = commands,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					vim.cmd("Telescope " .. selection[1])
				end)
				return true
			end,
		})
		:find()
end

-- Call the function
vim.keymap.set("n", "<leader>ft", telescope_builtin_commands, {})
