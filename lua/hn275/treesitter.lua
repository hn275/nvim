local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")

if not treesitter_status then
	return
end

-- Syntax highlighting configs
local highlight_parsers = { -- enabled languages parsers
	"javascript",
	"typescript",
	"tsx",
	"prisma",
	"json",
	"http",
	"html",
	"bash",
	"cpp",
	"css",
	"lua",
	"markdown",
	"python",
	"scss",
	"regex",
	"vim",
	"astro",
	"go",
    "rust",
    "dockerfile",
    "fish",
    "diff",
    "csv",
    "java",
    "sql",
}

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
	ensure_installed = highlight_parsers, -- install all parsers name
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
