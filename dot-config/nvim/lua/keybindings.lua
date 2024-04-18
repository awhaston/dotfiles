local map = vim.keymap.set

vim.g.mapleader = " "

-- Window navigation
map("n", "<C-j>", "<C-W>j")
map("n", "<C-h>", "<C-W>h")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-l>", "<C-W>l")
map("n", "<C-r>", "<C-W>r")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
