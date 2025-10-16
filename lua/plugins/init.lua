vim.filetype.add({
	extension = {
		mojo = "mojo",
	},
	pattern = {
		[".*%.🔥"] = "mojo",
	},
})

return {
	{ "folke/lazy.nvim", version = "*" },
	"nvim-lua/plenary.nvim",
	"christoomey/vim-tmux-navigator",
}
