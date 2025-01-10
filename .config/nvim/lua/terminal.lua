-- Terminal Functions
local set = vim.opt_local
function split_term()
    vim.cmd("belowright split")
    vim.cmd("terminal")
end

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    set.number = false
    set.relativenumber = false
    set.scrolloff = 0

    vim.bo.filetype = "terminal"
  end,
})
-- Terminal keybindings
vim.keymap.set("n", "<leader>wt", split_term, { desc = "Open Horizonal Terminal" })
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-N>", { desc = "Escape to normal mode" })
