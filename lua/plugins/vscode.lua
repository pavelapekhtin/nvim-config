return {
	{
		"tpope/vim-surround",
		event = "VeryLazy",
	},
	{
		"tpope/vim-repeat",
		event = "VeryLazy",
	},
	{
		"LazyVim/LazyVim",
		priority = 10000,
		lazy = false,
		config = function()
			-- VSCode specific configuration
			-- Set leader key for VSCode environment
			vim.g.mapleader = " "
			vim.g.maplocalleader = " "

			-- Using direct command mechanism approach
			local function vscodecmd(cmd, args)
				if args then
					vim.cmd('call VSCodeNotify("' .. cmd .. '", "' .. args .. '")')
				else
					vim.cmd('call VSCodeNotify("' .. cmd .. '")')
				end
			end

			-- Explicit mapping to allow Space as leader in VSCode
			vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

			-- Leader key test command
			vim.keymap.set("n", "<leader>test", function()
				vscodecmd("workbench.action.showInformationMessage", "Leader key is working!")
			end, { desc = "Test Leader Key" })

			-- Navigation mappings (matching your standard setup)
			vim.keymap.set("n", "gd", function() vscodecmd("editor.action.revealDefinition") end)
			vim.keymap.set("n", "gh", function() vscodecmd("editor.action.showHover") end)
			vim.keymap.set("n", "gH", function() vscodecmd("editor.action.referenceSearch.trigger") end)
			vim.keymap.set("n", "gD", function() vscodecmd("editor.action.peekDefinition") end)
			vim.keymap.set("n", "gO", function() vscodecmd("workbench.action.gotoSymbol") end)

			-- Search commands with leader+s (matching your telescope setup)
			vim.keymap.set("n", "<leader>sh", function() vscodecmd("workbench.action.showAllSymbols") end,
				{ desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", function() vscodecmd("workbench.action.openGlobalKeybindings") end,
				{ desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf", function() vscodecmd("workbench.action.quickOpen") end,
				{ desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>ss", function() vscodecmd("workbench.action.showCommands") end,
				{ desc = "[S]earch [S]elect Commands" })
			vim.keymap.set("n", "<leader>sw", function() vscodecmd("editor.action.addSelectionToNextFindMatch") end,
				{ desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", function() vscodecmd("workbench.action.findInFiles") end,
				{ desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", function() vscodecmd("workbench.actions.view.problems") end,
				{ desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>s.", function() vscodecmd("workbench.action.openRecent") end,
				{ desc = '[S]earch Recent Files ("." for repeat)' })

			-- Buffer navigation with leader+leader (matching your setup)
			vim.keymap.set("n", "<leader><leader>",
				function() vscodecmd("workbench.action.showAllEditorsByMostRecentlyUsed") end,
				{ desc = "[ ] Find existing buffers" })

			-- Fuzzy find in current file with leader+/
			vim.keymap.set("n", "<leader>/", function()
				vscodecmd("actions.find")
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- LSP and code actions
			vim.keymap.set("n", "<leader>ca", function() vscodecmd("editor.action.quickFix") end,
				{ desc = "[C]ode [A]ction" })
			vim.keymap.set("n", "<leader>rn", function() vscodecmd("editor.action.rename") end,
				{ desc = "[R]e[n]ame" })
			vim.keymap.set("n", "<leader>D", function() vscodecmd("editor.action.goToTypeDefinition") end,
				{ desc = "Type [D]efinition" })
			vim.keymap.set("n", "<leader>ds", function() vscodecmd("workbench.action.gotoSymbol") end,
				{ desc = "[D]ocument [S]ymbols" })
			vim.keymap.set("n", "<leader>ws", function() vscodecmd("workbench.action.showAllSymbols") end,
				{ desc = "[W]orkspace [S]ymbols" })

			-- Diagnostic keymaps
			vim.keymap.set("n", "<leader>q", function() vscodecmd("workbench.actions.view.problems") end,
				{ desc = "Open diagnostic [Q]uickfix list" })

			-- Toggle features
			vim.keymap.set("n", "<leader>th", function() vscodecmd("editor.action.toggleInlayHints") end,
				{ desc = "[T]oggle Inlay [H]ints" })
			vim.keymap.set("n", "<leader>tz", function() vscodecmd("workbench.action.toggleZenMode") end,
				{ desc = "[T]oggle [Z]en Mode" })
			vim.keymap.set("n", "<leader>tt", function() vscodecmd("workbench.action.toggleTerminal") end,
				{ desc = "[T]oggle [T]erminal" })

			-- Editor navigation
			vim.keymap.set("n", "<leader>e", function() vscodecmd("workbench.view.explorer") end,
				{ desc = "Open [E]xplorer" })
			vim.keymap.set("n", "<leader>g", function() vscodecmd("workbench.view.scm") end,
				{ desc = "Open [G]it" })
		end,
	},
}
