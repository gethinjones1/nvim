-- Configure how diagnostics are displayed
vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- could be "■", "▎", "x", etc.
		spacing = 2,
	},
	signs = true,   -- keep the W/E icons in the sign column
	underline = true, -- underline the problematic code
	update_in_insert = false,
	severity_sort = true, -- sort by severity when multiple on a line
})
