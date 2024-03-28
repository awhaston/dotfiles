return {
    "nvim-neo-tree/neo-tree.nvim",

    opts = {
        filesystem = {
            filtered_items = {
                hide_by_name = {
                    ".git",
                    ".DS_Store",
                    "thumbs.db",
                },
                dotfiles = false,
            },
        },
    },
}
