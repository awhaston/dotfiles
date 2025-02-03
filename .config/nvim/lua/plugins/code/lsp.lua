return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "hrsh7th/cmp-nvim-lsp", },
        },
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Configuring all the servers
            -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
            local lspconfig = require("lspconfig")
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.phpactor.setup {}


            lspconfig.cssls.setup({
                capabilities = capabilities,
            })

            -- lspconfig.eslint.setup({
            --     capabilities = capabilities,
            --     on_attach = function(client, bufnr)
            --         vim.api.nvim_create_autocmd("BufWritePre", {
            --             buffer = bufnr,
            --             command = "EslintFixAll",
            --         })
            --     end,
            --     workingDirectories = { mode = "auto" },
            -- })

            -- Ruby Lsp
            -- lspconfig.solargraph.setup({
            --     capabilities = capabilities,
            -- })

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

            -- lspconfig.tailwindcss.setup({
            --     capabilities = capabilities,
            -- })

            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            lspconfig.gopls.setup({})

            -- LSP Keybindings
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Goto Implementations" })
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
