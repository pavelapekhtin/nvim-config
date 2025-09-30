-- C-specific configuration
vim.opt_local.cindent = true
vim.opt_local.cinoptions = ":0,l1,t0,g0,(0"
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true
vim.opt_local.textwidth = 100
vim.opt_local.colorcolumn = "101"

-- Enable folding for C files
vim.opt_local.foldmethod = "syntax"
vim.opt_local.foldlevel = 99

-- C-specific keymaps
local opts = { buffer = true, noremap = true, silent = true }

-- Quick compile and run (adjust as needed)
vim.keymap.set("n", "<leader>cc", ":!gcc -Wall -Wextra -std=c11 % -o %:r && ./%:r<CR>",
    vim.tbl_extend("force", opts, { desc = "[C]ompile and run C file" }))

-- Format with clang-format
vim.keymap.set("n", "<leader>cf", ":!clang-format -i %<CR>",
    vim.tbl_extend("force", opts, { desc = "[C]lang [F]ormat file" }))

-- Switch between header and source files
vim.keymap.set("n", "<leader>ch", function()
    local current_file = vim.fn.expand("%")
    local alternate_file

    if current_file:match("%.c$") then
        alternate_file = current_file:gsub("%.c$", ".h")
    elseif current_file:match("%.h$") then
        alternate_file = current_file:gsub("%.h$", ".c")
    end

    if alternate_file and vim.fn.filereadable(alternate_file) == 1 then
        vim.cmd("edit " .. alternate_file)
    else
        print("Alternate file not found: " .. (alternate_file or "unknown"))
    end
end, vim.tbl_extend("force", opts, { desc = "Switch to [C] [H]eader/source" }))
