-- Map leader key
vim.g.mapleader = " ";

-- Remap explorer (Doesn't work with nvimtree, but this can stay)
-- vim.keymap.set("n", "<leader>p", vim.cmd.Ex);

-- Remap Window navigation
vim.keymap.set("n", "<C-j>", "<C-W>j");
vim.keymap.set("n", "<C-h>", "<C-W>h");
vim.keymap.set("n", "<C-k>", "<C-W>k");
vim.keymap.set("n", "<C-l>", "<C-W>l");
vim.keymap.set("n", "<C-r>", "<C-W>r")


vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action);
