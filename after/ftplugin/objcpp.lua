-- Objective-C++ specific configuration
vim.opt_local.cindent = true
vim.opt_local.cinoptions = ":0,l1,t0,g0,(0"
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true
vim.opt_local.textwidth = 100
vim.opt_local.colorcolumn = "101"

-- Enable folding for Objective-C++ files
vim.opt_local.foldmethod = "syntax"
vim.opt_local.foldlevel = 99

-- Objective-C++ specific keymaps
local opts = { buffer = true, noremap = true, silent = true }

-- Quick compile and run (adjust as needed)
vim.keymap.set("n", "<leader>cc", ":!clang++ -framework Foundation % -o %:r && ./%:r<CR>",
    vim.tbl_extend("force", opts, { desc = "[C]ompile and run Objective-C++ file" }))

-- Format with clang-format
vim.keymap.set("n", "<leader>cf", ":!clang-format -i %<CR>",
    vim.tbl_extend("force", opts, { desc = "[C]lang [F]ormat file" }))

-- Switch between header and implementation files
vim.keymap.set("n", "<leader>ch", function()
    local current_file = vim.fn.expand("%")
    local alternate_file

    if current_file:match("%.mm$") then
        alternate_file = current_file:gsub("%.mm$", ".h")
    elseif current_file:match("%.h$") then
        alternate_file = current_file:gsub("%.h$", ".mm")
    end

    if alternate_file and vim.fn.filereadable(alternate_file) == 1 then
        vim.cmd("edit " .. alternate_file)
    else
        print("Alternate file not found: " .. (alternate_file or "unknown"))
    end
end, vim.tbl_extend("force", opts, { desc = "Switch to Objective-C++ [H]eader/implementation" }))

-- Generate interface/implementation skeleton with C++ support
vim.keymap.set("n", "<leader>ci", function()
    local current_file = vim.fn.expand("%")
    local filename = vim.fn.expand("%:t:r")

    if current_file:match("%.h$") then
        -- Generate interface in header file with C++ compatibility
        local lines = {
            "#import <Foundation/Foundation.h>",
            "#ifdef __cplusplus",
            "#include <iostream>",
            "#include <string>",
            "#endif",
            "",
            "@interface " .. filename .. " : NSObject",
            "",
            "@end"
        }
        vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
        vim.api.nvim_win_set_cursor(0, {8, 0})
    elseif current_file:match("%.mm$") then
        -- Generate implementation in source file
        local header_file = filename .. ".h"
        local lines = {
            "#import \"" .. header_file .. "\"",
            "#include <iostream>",
            "#include <string>",
            "",
            "@implementation " .. filename,
            "",
            "@end"
        }
        vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
        vim.api.nvim_win_set_cursor(0, {6, 0})
    else
        print("Interface/implementation skeleton can only be generated for .h or .mm files")
    end
end, vim.tbl_extend("force", opts, { desc = "Generate Objective-C++ [I]nterface/implementation" }))

-- Insert method skeleton with C++ support
vim.keymap.set("n", "<leader>cm", function()
    local method_name = vim.fn.input("Method name: ")
    if method_name ~= "" then
        local lines = {
            "- (void)" .. method_name .. " {",
            "    // TODO: Implement " .. method_name,
            "    // C++ code can be used here",
            "}"
        }
        local current_line = vim.api.nvim_win_get_cursor(0)[1]
        vim.api.nvim_buf_set_lines(0, current_line, current_line, false, lines)
        vim.api.nvim_win_set_cursor(0, {current_line + 2, 4})
    end
end, vim.tbl_extend("force", opts, { desc = "Insert Objective-C++ [M]ethod skeleton" }))

-- Insert C++ class within Objective-C++ context
vim.keymap.set("n", "<leader>cpp", function()
    local class_name = vim.fn.input("C++ class name: ")
    if class_name ~= "" then
        local lines = {
            "// C++ class definition",
            "class " .. class_name .. " {",
            "public:",
            "    " .. class_name .. "();",
            "    ~" .. class_name .. "();",
            "",
            "private:",
            "    // Private members",
            "};"
        }
        local current_line = vim.api.nvim_win_get_cursor(0)[1]
        vim.api.nvim_buf_set_lines(0, current_line, current_line, false, lines)
        vim.api.nvim_win_set_cursor(0, {current_line + 8, 4})
    end
end, vim.tbl_extend("force", opts, { desc = "Insert C++ class in Objective-C++" }))
