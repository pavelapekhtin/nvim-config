-- This file is now minimal since tool installation is handled
-- in the main code.lua file through mason-tool-installer.
--
-- The ensure_installed list in code.lua manages:
-- - LSP servers (clangd, gopls, rust_analyzer, lua_ls)
-- - Formatters (stylua, clang-format, gofumpt, goimports, golines, rustfmt)
--
-- If you need to add Mason-specific configuration options
-- (not just tool installation), you can add them here.

return {
  -- Mason configuration options can go here
  -- ensure_installed is now managed in code.lua
}
