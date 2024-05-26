return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            local config = require("nvim-treesitter.configs")

            config.setup({
                ensure_installed = {
                    "lua",
                    "javascript",
                    "bash",
                    "html",
                    "json",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "query",
                    "regex",
                    "tsx",
                    "typescript",
                    "vim",
                    "yaml",
                    "go",
                    "gomod",
                    "gosum",
                    "gotmpl",
                    "gowork",
                },
                highlight = { enabled = true },
                indent = { enabled = true },
            })
        end,
    },
}
