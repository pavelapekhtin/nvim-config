return {
	-- You can easily change to a different colorscheme.
	-- Change the name of the colorscheme plugin below, and then
	-- change the command in the config to whatever the name of that colorscheme is.
	--
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "auto",
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false,
				show_end_of_buffer = false,
				term_colors = false,
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				integrations = {
					treesitter = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
					},
					lsp_trouble = true,
					lsp_saga = true,
					gitgutter = false,
					gitsigns = true,
					telescope = true,
					nvimtree = {
						enabled = true,
						show_root = true,
						transparent_panel = false,
					},
					which_key = true,
					indent_blankline = { enabled = true },
					notify = true,
					noice = true,
					mini = true,
					mason = true,
					neotree = {
						enabled = true,
						show_root = true,
						transparent_panel = false,
					},
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				styles = {
					comments = { italic = false },
				},
			})
		end,
	},
	{
		"nvim-lua/plenary.nvim",
		name = "colorscheme-switcher",
		priority = 1001,
		config = function()
			-- Function to check if current file is in mainvault directory
			local function is_in_mainvault()
				local current_file = vim.fn.expand('%:p')
				return current_file:match('/mainvault/') ~= nil
			end

			-- Function to set colorscheme based on file location
			local function set_colorscheme()
				if not vim.g.vscode and not vim.g.cursor then
					if is_in_mainvault() then
						vim.cmd.colorscheme("catppuccin-latte") -- Latte theme for mainvault
					else
						vim.cmd.colorscheme("tokyonight-night") -- Tokyo Night for other files
					end
				end
			end

			-- Set initial colorscheme
			set_colorscheme()

			-- Create autocommand to change colorscheme when switching buffers
			vim.api.nvim_create_autocmd("BufEnter", {
				callback = set_colorscheme,
			})
		end,
	},
}
