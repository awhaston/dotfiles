return {
    {
        "awhaston/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            -- Rust
            vim.lsp.config('rust_analyzer', {
                settings = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            enable = false,
                        }
                    }
                }
            })

            vim.lsp.enable('rust_analyzer')

            vim.lsp.config('texlab', {
                settings = {
                    texlab = {
                        build = {
                            executable = "latexmk",
                            args = {
                                "-xelatex",
                                "-interaction=nonstopmode",
                                "-synctex=1",
                                "-output-directory=build",
                                "%f",
                            },
                            onSave = true,
                            forwardSearchAfter = true,
                            directory = "build",
                        },
                        auxDirectory = "build",
                        forwardSearch = {
                            executable = "zathura", -- or skim, okular, etc.
                            args = { "--synctex-forward", "%l:1:%f", "%p" },
                        },
                    }
                }
            }
            )

            -- LaTeX
            vim.lsp.enable('texlab')

            -- JavaScript/TypeScript
            vim.lsp.config('tsserver', {
                settings = {
                    completions = {
                        completeFunctionCalls = true,
                    },
                },
            })
            vim.lsp.enable('tsserver')

            -- PHP
            vim.lsp.config('phpactor', {})
            vim.lsp.enable('phpactor')

            -- Svelte
            vim.lsp.config('svelte', {})
            vim.lsp.enable('svelte')

            -- Arduino
            vim.lsp.config('arduino_language_server', {
                cmd = {
                    "arduino-language-server",
                    "-cli-config",
                    "~/.arduino15/arduino-cli.yaml",
                    "-cli",
                    "arduino-cli",
                    "-clangd",
                    "clangd",
                    "-fqbn",
                    "arduino:renesas_uno:unor4wifi",
                },
                filetypes = { "arduino" },
                root_dir = function(fname)
                    return vim.lsp.util.root_pattern("platformio.ini")(fname) or
                        vim.lsp.util.root_pattern(".git")(fname) or
                        vim.lsp.util.path.dirname(fname)
                end,
            })
            vim.lsp.enable('arduino_language_server')

            -- CSS
            vim.lsp.config('cssls', {
                capabilities = capabilities,
            })
            vim.lsp.enable('cssls')

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


            -- HTML
            vim.lsp.config('html', {
                capabilities = capabilities,
            })
            vim.lsp.enable('html')

            -- Lua
            vim.lsp.config('lua_ls', {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
            vim.lsp.enable('lua_ls')

            -- C/C++
            vim.lsp.config('clangd', {
                capabilities = capabilities,
            })
            vim.lsp.enable('clangd')


            -- Tailwind CSS
            -- vim.lsp.config('tailwindcss', {
            --     capabilities = capabilities,
            -- })
            -- vim.lsp.enable('tailwindcss')

            -- Python
            vim.lsp.config('pyright', {
                capabilities = capabilities,
            })
            vim.lsp.enable('pyright')

            -- Go
            vim.lsp.config('gopls', {})
            vim.lsp.enable('gopls')

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
