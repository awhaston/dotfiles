local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("keybindings")
require("autocommands")
require("options")
require("lazy").setup({
    { import = "plugins.ui" },
    { import = "plugins.code" },
    { import = "plugins.code.langs" },
})

vim.cmd([[colorscheme rasmus]])

vim.keymap.set("n", "<leader>L", ":Lazy <CR>", { desc = "Show Lazy" })
