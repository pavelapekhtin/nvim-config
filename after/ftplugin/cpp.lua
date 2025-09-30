-- C++ specific configuration
vim.opt_local.cindent = true
vim.opt_local.cinoptions = ":0,l1,t0,g0,(0"
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true
vim.opt_local.textwidth = 100
vim.opt_local.colorcolumn = "101"

-- Enable folding for C++ files
vim.opt_local.foldmethod = "syntax"
vim.opt_local.foldlevel = 99

-- C++ specific keymaps
local opts = { buffer = true, noremap = true, silent = true }

-- Quick compile and run (adjust as needed)
vim.keymap.set("n", "<leader>cc", ":!g++ -Wall -Wextra -std=c++17 % -o %:r && ./%:r<CR>",
    vim.tbl_extend("force", opts, { desc = "[C]ompile and run C++ file" }))

-- Format with clang-format
vim.keymap.set("n", "<leader>cf", ":!clang-format -i %<CR>",
    vim.tbl_extend("force", opts, { desc = "[C]lang [F]ormat file" }))

-- Switch between header and source files
vim.keymap.set("n", "<leader>ch", function()
    local current_file = vim.fn.expand("%")
    local alternate_file

    if current_file:match("%.cpp$") then
        alternate_file = current_file:gsub("%.cpp$", ".hpp")
        if vim.fn.filereadable(alternate_file) == 0 then
            alternate_file = current_file:gsub("%.cpp$", ".h")
        end
    elseif current_file:match("%.cc$") then
        alternate_file = current_file:gsub("%.cc$", ".hpp")
        if vim.fn.filereadable(alternate_file) == 0 then
            alternate_file = current_file:gsub("%.cc$", ".h")
        end
    elseif current_file:match("%.cxx$") then
        alternate_file = current_file:gsub("%.cxx$", ".hpp")
        if vim.fn.filereadable(alternate_file) == 0 then
            alternate_file = current_file:gsub("%.cxx$", ".h")
        end
    elseif current_file:match("%.hpp$") then
        alternate_file = current_file:gsub("%.hpp$", ".cpp")
        if vim.fn.filereadable(alternate_file) == 0 then
            alternate_file = current_file:gsub("%.hpp$", ".cc")
        end
        if vim.fn.filereadable(alternate_file) == 0 then
            alternate_file = current_file:gsub("%.hpp$", ".cxx")
        end
    elseif current_file:match("%.h$") then
        alternate_file = current_file:gsub("%.h$", ".cpp")
        if vim.fn.filereadable(alternate_file) == 0 then
            alternate_file = current_file:gsub("%.h$", ".cc")
        end
        if vim.fn.filereadable(alternate_file) == 0 then
            alternate_file = current_file:gsub("%.h$", ".cxx")
        end
    end

    if alternate_file and vim.fn.filereadable(alternate_file) == 1 then
        vim.cmd("edit " .. alternate_file)
    else
        print("Alternate file not found: " .. (alternate_file or "unknown"))
    end
end, vim.tbl_extend("force", opts, { desc = "Switch to [C]++ [H]eader/source" }))

-- Generate header guards for header files
vim.keymap.set("n", "<leader>cg", function()
    local current_file = vim.fn.expand("%")
    if current_file:match("%.h$") or current_file:match("%.hpp$") then
        local guard_name = current_file:upper():gsub("[^%w]", "_") .. "_"
        local lines = {
            "#ifndef " .. guard_name,
            "#define " .. guard_name,
            "",
            "",
            "",
            "#endif // " .. guard_name
        }
        vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
        vim.api.nvim_win_set_cursor(0, {4, 0})
    else
        print("Header guards can only be generated for .h or .hpp files")
    end
end, vim.tbl_extend("force", opts, { desc = "[C]++ [G]enerate header guard" }))
