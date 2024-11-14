-- Terminal Functions
function split_term()
    vim.cmd("belowright split")
    vim.cmd("terminal")
end

-- Terminal keybindings
vim.keymap.set("n", "<leader>wt", ":lua split_term()<CR>", { desc = "Open Horizonal Terminal" })
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-N>", { desc = "Escape to normal mode" })
