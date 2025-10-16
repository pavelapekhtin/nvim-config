-- This file is now minimal since LSP configurations are handled
-- in the main code.lua file through the servers table.
--
-- The servers table in code.lua manages:
-- - clangd (C/C++/Objective-C/Objective-C++)
-- - gopls (Go)
-- - rust_analyzer (Rust)
-- - lua_ls (Lua)
--
-- If you need to add custom LSP configurations that aren't
-- managed by mason-lspconfig, you can add them here.

local lspconfig = require("lspconfig")

-- Example of a custom LSP configuration that might not be in Mason:
-- lspconfig.custom_lsp.setup({
--     -- custom configuration here
-- })

lspconfig.mojo.setup({
	cmd = { "mojo-lsp-server" },
	filetypes = { "mojo" },
	root_dir = lspconfig.util.root_pattern("mojoproject.toml", ".git"),
	on_new_config = function(config, root_dir)
		-- Check for virtual environment in project
		local venv_lsp = root_dir .. "/venv/bin/mojo-lsp-server"
		if vim.fn.executable(venv_lsp) == 1 then
			config.cmd = { venv_lsp }
		end
	end,
})
