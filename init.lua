--[[
--
--Order of exectuion: 
--* options to set <leader>
--* lazyconf to setup plugins
--* keymaps after plugins 
--
--neovide and autocmds can be at last
--]]
require("options")

require("lazyconf")

require("keymaps")

require("autocmd")

vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})

require("abbreviations")

require("nvim-treesitter.install").prefer_git = true

if vim.g.neovide then
	require("neovide")
end
