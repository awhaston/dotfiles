return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")

            require("telescope").setup({
                defaults = {
                    mappings = {
                        n = {
                            ["q"] = actions.close,
                        },
                    },
                },
            })

            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
            vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find Files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find Grep" })
        end,
    },
}
