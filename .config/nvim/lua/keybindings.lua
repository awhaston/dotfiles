vim.g.mapleader = " "

local map = vim.keymap.set

-- Window navigation
map("n", "<C-j>", "<C-W>j")
map("n", "<C-h>", "<C-W>h")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-l>", "<C-W>l")
map("n", "<C-r>", "<C-W>r")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted line down" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted line down" })

vim.keymap.set("n", "<leader>sc", ":source ~/.config/nvim/init.lua <CR>", { desc = "Source configs" })

vim.keymap.set("n", "dd", function()
    if vim.api.nvim_get_current_line():match("^%s*$") then
        return '"_dd'
    else
        return "dd"
    end
end, { expr = true, desc = "Smart Yank: Does not yank empty lines" })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank into System Clipboard" })

function split_term()
    vim.cmd("belowright split")
    vim.cmd("terminal")
end

-- Open horizontal terminal
vim.keymap.set("n", "<leader>wt", ":lua split_term()<CR>", { desc = "Open Horizonal Terminal" })
vim.keymap.set("t", "<C-N>", "<C-\\><C-N>", { desc = "Escape to normal mode" })

-- Window keybindings
vim.keymap.set("n", "<leader>wf", "<C-w>_<C-w>|<CR>", { desc = "Fullscreen windows" })
vim.keymap.set("n", "<leader>wF", "<C-w>=<CR>", { desc = "Equalize windows" })
vim.keymap.set("n", "<leader>wh", "<C-w>s<CR>", { desc = "Horizonal split" })
vim.keymap.set("n", "<leader>wv", "<C-w>v<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>wx", "<C-w>v<CR>", { desc = "Kill window" })
