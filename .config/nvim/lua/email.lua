-- Email syntax highlighting
vim.api.nvim_create_autocmd("FileType", {
    pattern = "mail",
    callback = function()
        print("Setting up email syntax highlighting and formatting...")
        vim.opt_local.textwidth = 80
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en"
        vim.opt_local.formatoptions = "tcqwan"

        -- Start in insert mode after headers
        vim.cmd("normal! }o")
        vim.cmd("startinsert")
    end,
})
