if vim.g.neovide then
    -- Allow clipboard copy paste in neovim
    vim.g.neovide_input_use_logo = 1
    vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })
    vim.keymap.set("i", "<D-v>", "<C-r>*")
    -- Display configuration
    vim.o.guifont = "RobotoMono Nerd Font:h17"
    vim.g.neovide_cursor_animation_length = 0.0
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_cursor_animate_in_insert_mode = false
end
