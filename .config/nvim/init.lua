local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- vim.lsp.set_log_level("debug")


require("keybindings")
require("autocommands")
require("options")
require("commands")
require("terminal")
require("prose")
require("email")
require("netrw")
require("lazy").setup({
    { import = "plugins.ui" },
    { import = "plugins.code" },
    { import = "plugins.local" },
    lazy = true,
})
require("colorscheme")

vim.keymap.set("n", "<leader>L", ":Lazy <CR>", { desc = "Show Lazy" })
