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
            vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Find References" })
            vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { desc = "Find Implementations" })
            vim.keymap.set("n", "<leader>ft", builtin.lsp_type_definitions, { desc = "Find Type Definitions" })
            vim.keymap.set(
                "n",
                "<leader>fd",
                ":lua require('telescope.builtin').diagnostics({bufnr = 0}) <CR>",
                { desc = "Find Diagnostics Current Buffer" }
            )
            vim.keymap.set("n", "<leader>fD", builtin.diagnostics, { desc = "Find Diagnostics Project" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
        end,
    },
}
