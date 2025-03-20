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
				flavour = "latte",
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
					noice = {
						enabled = true,
						custom_hlgroups = {},
					},
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
				style = "night",
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
			-- Function to check if macOS is in light mode
			local function is_macos_light_mode()
				local handle = io.popen('defaults read -g AppleInterfaceStyle 2>/dev/null')
				if handle then
					local result = handle:read("*a")
					handle:close()
					return result == ""
				end
				return false
			end

			-- Function to check if any buffer is in mainvault directory
			local function has_mainvault_buffer()
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if vim.api.nvim_buf_is_loaded(buf) then
						local bufname = vim.api.nvim_buf_get_name(buf)
						if bufname:match('/mainvault/') then
							return true
						end
					end
				end
				return false
			end

			-- Function to set colorscheme
			local function set_colorscheme()
				if not vim.g.vscode and not vim.g.cursor then
					local is_light = is_macos_light_mode()
					local has_mainvault = has_mainvault_buffer()
					
					if has_mainvault and is_light then
						vim.cmd.colorscheme("catppuccin-latte")
					else
						vim.cmd.colorscheme("tokyonight-night")
					end
				end
			end

			-- Set initial colorscheme
			set_colorscheme()

			-- Create autocommands to change colorscheme when switching buffers or windows
			vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "BufRead" }, {
				callback = set_colorscheme,
			})

			-- Create a timer to check system appearance periodically (every 10 seconds)
			local timer = vim.loop.new_timer()
			timer:start(0, 10000, vim.schedule_wrap(function()
				set_colorscheme()
			end))

			-- Clean up timer when Neovim exits
			vim.api.nvim_create_autocmd("VimLeavePre", {
				callback = function()
					timer:stop()
					timer:close()
				end,
			})
		end,
	},
}
