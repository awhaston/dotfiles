return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "williamboman/mason.nvim",
                lazy = false,
                config = function()
                    require("mason").setup()

                    vim.keymap.set("n", "<leader>M", ":Mason <CR>", { desc = "Mason" })
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
                            "eslint",
                            "cssls",
                            -- Python
                            "pyright",
                            -- C
                            "cmake",
                            "clangd",
                            -- Go
                            "gopls",
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

            lspconfig.cssls.setup({
                capabilities = capabilities,
            })

            lspconfig.eslint.setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
                workingDirectories = { mode = "auto" },
            })

            lspconfig.solargraph.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
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

            lspconfig.gopls.setup({})

            -- LSP Keybindings
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Goto References" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
            vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostic" })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
            vim.keymap.set("n", "<leader>cD", vim.diagnostic.setloclist, { desc = "Get Diagnostic List" })
            vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>", { desc = "Restart LSP Servers" })
        end,
    },
}
