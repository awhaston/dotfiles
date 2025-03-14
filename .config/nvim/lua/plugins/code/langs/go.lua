return {
    {

        "awhaston/gopher.nvim",
        requires = { -- dependencies
            "awhaston/plenary.nvim",
            "awhaston/nvim-treesitter",
        },
        ft = "go",
        config = function()
            require("gopher").setup({
                commands = {
                    go = "go",
                    gomodifytags = "gomodifytags",
                    gotests = "~/go/bin/gotests", -- also you can set custom command path
                    impl = "impl",
                    iferr = "iferr",
                },
            })
        end,
    },
}
