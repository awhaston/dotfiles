-- Map leader key
vim.g.mapleader = " ";

-- Remap explorer (Doesn't work with nvimtree, but this can stay)
-- vim.keymap.set("n", "<leader>p", vim.cmd.Ex);
vim.keymap.set("n", "<leader>p", vim.cmd.Ex);

-- Remap Window navigation
vim.keymap.set("n", "<C-j>", "<C-W>j");
vim.keymap.set("n", "<C-h>", "<C-W>h");
vim.keymap.set("n", "<C-k>", "<C-W>k");


vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action);
