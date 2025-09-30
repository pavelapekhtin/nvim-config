-- Objective-C specific configuration
vim.opt_local.cindent = true
vim.opt_local.cinoptions = ":0,l1,t0,g0,(0"
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true
vim.opt_local.textwidth = 100
vim.opt_local.colorcolumn = "101"

-- Enable folding for Objective-C files
vim.opt_local.foldmethod = "syntax"
vim.opt_local.foldlevel = 99

-- Objective-C specific keymaps
local opts = { buffer = true, noremap = true, silent = true }

-- Quick compile and run (adjust as needed)
vim.keymap.set("n", "<leader>cc", ":!clang -framework Foundation % -o %:r && ./%:r<CR>",
    vim.tbl_extend("force", opts, { desc = "[C]ompile and run Objective-C file" }))

-- Format with clang-format
vim.keymap.set("n", "<leader>cf", ":!clang-format -i %<CR>",
    vim.tbl_extend("force", opts, { desc = "[C]lang [F]ormat file" }))

-- Switch between header and implementation files
vim.keymap.set("n", "<leader>ch", function()
    local current_file = vim.fn.expand("%")
    local alternate_file

    if current_file:match("%.m$") then
        alternate_file = current_file:gsub("%.m$", ".h")
    elseif current_file:match("%.h$") then
        alternate_file = current_file:gsub("%.h$", ".m")
    end

    if alternate_file and vim.fn.filereadable(alternate_file) == 1 then
        vim.cmd("edit " .. alternate_file)
    else
        print("Alternate file not found: " .. (alternate_file or "unknown"))
    end
end, vim.tbl_extend("force", opts, { desc = "Switch to Objective-C [H]eader/implementation" }))

-- Generate interface/implementation skeleton
vim.keymap.set("n", "<leader>ci", function()
    local current_file = vim.fn.expand("%")
    local filename = vim.fn.expand("%:t:r")

    if current_file:match("%.h$") then
        -- Generate interface in header file
        local lines = {
            "#import <Foundation/Foundation.h>",
            "",
            "@interface " .. filename .. " : NSObject",
            "",
            "@end"
        }
        vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
        vim.api.nvim_win_set_cursor(0, {4, 0})
    elseif current_file:match("%.m$") then
        -- Generate implementation in source file
        local header_file = filename .. ".h"
        local lines = {
            "#import \"" .. header_file .. "\"",
            "",
            "@implementation " .. filename,
            "",
            "@end"
        }
        vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
        vim.api.nvim_win_set_cursor(0, {4, 0})
    else
        print("Interface/implementation skeleton can only be generated for .h or .m files")
    end
end, vim.tbl_extend("force", opts, { desc = "Generate Objective-C [I]nterface/implementation" }))

-- Insert method skeleton
vim.keymap.set("n", "<leader>cm", function()
    local method_name = vim.fn.input("Method name: ")
    if method_name ~= "" then
        local lines = {
            "- (void)" .. method_name .. " {",
            "    // TODO: Implement " .. method_name,
            "}"
        }
        local current_line = vim.api.nvim_win_get_cursor(0)[1]
        vim.api.nvim_buf_set_lines(0, current_line, current_line, false, lines)
        vim.api.nvim_win_set_cursor(0, {current_line + 2, 4})
    end
end, vim.tbl_extend("force", opts, { desc = "Insert Objective-C [M]ethod skeleton" }))
