-- File is used for any editing based plugins
-- Contains vim-sleuth, which is used for automatic identations
-- trim.nvim which is used for automatically trimming whitespace
return {
	{
		"tpope/vim-sleuth",
		event = "VeryLazy",
	},
	{
		"tpope/vim-surround",
		event = "VeryLazy",
	},
	{
		"tpope/vim-repeat",
		event = "VeryLazy",
	},
	{
		"cappyzawa/trim.nvim",
		event = "VeryLazy",
		opts = {
			ft_blocklist = { "markdown" },
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
			-- Disable auto-pairs for large files to improve performance
			vim.api.nvim_create_autocmd("BufReadPre", {
				callback = function()
					if vim.b.large_file then
						vim.b.autopairs_enabled = 0
					end
				end,
			})
		end,
	},
}
