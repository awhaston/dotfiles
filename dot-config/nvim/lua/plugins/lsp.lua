return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "williamboman/mason.nvim",
                lazy = false,
                config = function()
                    require("mason").setup()
                end,
            },
            {
                "hrsh7th/cmp-nvim-lsp",
            },
            {
                "williamboman/mason-lspconfig.nvim",
                lazy = false,
                config = function()
                    require("mason-lspconfig").setup({
                        -- Formatters are in none-lsp.lua
                        ensure_installed = {
                            -- Lua
                            "lua_ls",
                            -- Javascript/Typescript
                            "tsserver",
                            "html",
                            "tailwindcss",
                            -- Python
                            "pyright",
                            -- C
                            "cmake",
                            "clangd",
                        },
                    })
                end,
            },
        },
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Configuring all the servers
            local lspconfig = require("lspconfig")
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })

            lspconfig.solargraph.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.clangd.setup({
                capabilities = capabilities,
            })

            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })

            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            lspconfig.cmake.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Goto References" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
        end,
    },
}
