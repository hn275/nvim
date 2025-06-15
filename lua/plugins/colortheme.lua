return {
	"navarasu/onedark.nvim",
	config = function()
		local colortheme = require("onedark")
		colortheme.setup({
			style = "darker",
		})
		colortheme.load()

		-- color themes for tabline
		-- Define One Dark color palette
		local colors = {
			black = "#181a1f",
			bg0 = "#282c34",
			bg1 = "#31353f",
			bg2 = "#393f4a",
			bg3 = "#3b3f4c",
			bg_d = "#21252b",
			bg_blue = "#73b8f1",
			bg_yellow = "#ebd09c",
			fg = "#abb2bf",
			purple = "#c678dd",
			green = "#98c379",
			orange = "#d19a66",
			blue = "#61afef",
			yellow = "#e5c07b",
			cyan = "#56b6c2",
			red = "#e86671",
			grey = "#5c6370",
			light_grey = "#848b98",
			dark_cyan = "#2b6f77",
			dark_red = "#993939",
			dark_yellow = "#93691d",
			dark_purple = "#8a3fa0",
			diff_add = "#31392b",
			diff_delete = "#382b2c",
			diff_change = "#1c3448",
			diff_text = "#2c5372",
		}

		-- Set highlight groups using One Dark theme colors
		vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.bg3, fg = "NONE" })
		vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.fg, bg = colors.black })
		vim.api.nvim_set_hl(0, "TabLineSel", { bg = colors.blue, fg = colors.bg0, bold = true })
		vim.api.nvim_set_hl(0, "TabLine", { bg = colors.subtle, fg = colors.fg })
		vim.api.nvim_set_hl(0, "TabLineFill", { bg = colors.black, fg = colors.fg })
		vim.api.nvim_set_hl(0, "TabLineModified", { fg = colors.red, bg = colors.bg0 })
		vim.api.nvim_set_hl(0, "TabLineModifiedSel", { fg = colors.yellow, bg = colors.blue, bold = true })

		-- color themes for cmp
		vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

		vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
		vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
		vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

		vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
		vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
		vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })

		vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
		vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
		vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

		vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
		vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
		vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
		vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
		vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

		vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
		vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

		vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
		vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
		vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

		vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
		vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
		vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

		vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
		vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
		vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })
	end,
}
