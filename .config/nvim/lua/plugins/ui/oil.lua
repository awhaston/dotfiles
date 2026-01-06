return {
    {
        "awhaston/oil.nvim",
        branch = "master",
        dependencies = "awhaston/nvim-web-devicons",
        config = function()
            require("oil").setup({
                columns = {
                    "icon",
                    "permissions",
                    "size",
                    "mtime",
                },
                view_options = {
                    show_hidden = true,
                }
            })
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end,
    },
}
