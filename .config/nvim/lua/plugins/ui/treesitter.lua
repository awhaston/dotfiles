return {
    {
        "awhaston/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        config = function()
            require 'nvim-treesitter'.setup {
                -- Directory to install parsers and queries to
                install_dir = vim.fn.stdpath('data') .. '/site'
            }
            require 'nvim-treesitter'.install {
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
                "css",
            }
        end,
    },
}
