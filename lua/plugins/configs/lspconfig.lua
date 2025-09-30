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
