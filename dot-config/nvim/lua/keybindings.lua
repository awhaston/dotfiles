local map = vim.keymap.set

vim.g.mapleader = " "

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

vim.keymap.set(
    "n",
    "<leader>gg",
    "<cmd>!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>",
    { desc = "Git Go" }
) -- opens lazygit in a new tmux window
