return {
    "nvim-neo-tree/neo-tree.nvim",

    opts = {
        close_if_last_window = true,
        event_handlers = {

            {
                event = "file_opened",
                -- Auto close on file open
                handler = function()
                    require("neo-tree.command").execute({ action = "close" })
                end,
            },
        },
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
