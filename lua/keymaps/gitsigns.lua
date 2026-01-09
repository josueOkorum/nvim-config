---@type Keymap
return {
	["<leader>l"] = {
		action = "<cmd>Gitsigns blame_line<CR>",
		description = "git blame line",
	},
	["bla"] = {
		action = "<cmd>Gitsigns blame<CR>",
		description = "git  blame",
	},
}
