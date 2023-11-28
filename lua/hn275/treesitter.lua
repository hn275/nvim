local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")

if not treesitter_status then
	print("treesitter not found")
	return
end

-- Autotag configs
local autotag_filetypes = { -- enabled file types
	"html",
	"javascript",
	"javascriptreact",
	"jsx",
	"typescript",
	"typescriptreact",
	"tsx",
	"xml",
	"markdown",
	"astro",
}

treesitter.setup({
	auto_install = true,
	highlight = {
		enable = true, -- enabling highlight
	},
	indent = {
		enable = true, -- enable auto indentation
	},
	autotag = {
		enable = true, -- enabling tag completion
		filetypes = autotag_filetypes, -- auto enable on these filetypes
	},
})
