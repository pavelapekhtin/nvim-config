-- VSCode/Cursor specific settings
-- This file is loaded when Neovim is run from VSCode (detected by vim.g.vscode being set)

-- Force leader key setup (redundant but important for VSCode)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Configure clipboard for VSCode integration
vim.opt.clipboard = "unnamedplus"

-- Ensure we have good defaults for VSCode
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Use a different approach for VSCode commands with the leader key
-- that doesn't rely on the VSCodeNotify function

-- This function uses vscode-neovim's command mechanism
local function vscodecmd(cmd, args)
    if args then
        vim.cmd('call VSCodeNotify("' .. cmd .. '", "' .. args .. '")')
    else
        vim.cmd('call VSCodeNotify("' .. cmd .. '")')
    end
end


-- Escape key to exit visual mode immediately
vim.keymap.set('v', '<Esc>', '<Esc>', { noremap = true })

-- Remove keymaps that would conflict with VSCode's own functionality
-- Most keymaps are now defined in lua/plugins/vscode.lua
