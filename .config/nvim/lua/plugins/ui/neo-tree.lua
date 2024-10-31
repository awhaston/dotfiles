return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        enabled = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = false,

                filesystem = {
                    filtered_items = {
                        visible = false, -- when true, they will just be displayed differently than normal items
                        hide_dotfiles = true,
                        hide_gitignored = false,
                        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                            ".DS_Store",
                            "thumbs.db",
                        },
                        hide_by_name = {
                            "node_modules",
                        },
                    },
                },
                window = {
                    position = "float",
                    width = 40,
                    mapping_options = {
                        noremap = true,
                        nowait = true,
                    },
                    -- Close Neo-Tree of file open
                    event_handlers = {
                        {
                            event = "file_opened",
                            handler = function(file_path)
                                require("neo-tree.command").execute({ action = "close" })
                            end,
                        },
                    },
                },
            })

            vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-Tree" })
        end,
    },
}
