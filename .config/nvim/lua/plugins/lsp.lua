add_plugin(
    { src  = "awhaston/nvim-lspconfig" },
    {
        deps = { src = "awhaston/cmp-nvim-lsp" }
    },
    function ()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
        -- JavaScript/TypeScript
        vim.lsp.config('ts_ls', {
            capabilities = capabilities,
            settings = {
                completions = {
                    completeFunctionCalls = true,
                },
            },
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        })
        vim.lsp.enable('ts_ls')

        -- PHP
        vim.lsp.config('phpactor', {})
        vim.lsp.enable('phpactor')
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                local bufname = vim.api.nvim_buf_get_name(args.buf)

                if bufname:match("%.template%.php$") then
                    client.stop()
                end
            end,
        })

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
        vim.lsp.config('gopls', {
            capabilities = capabilities
        })
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
    end
)

add_plugin(
    { src = "awhaston/nvim-cmp" },
    {},
    function ()
        local cmp = require("cmp")

        require("snippets").register_cmp_source()
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "snp" },
            }, {
                { name = "buffer" },
            }),
        })
    end
)

add_plugin(
    { src = "awhaston/none-ls.nvim" },
    {},
    function ()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        null_ls.setup({
            sources = {
                -- null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.stylua,
                -- null_ls.builtins.formatting.clang_format,
                -- -- Go
                null_ls.builtins.code_actions.gomodifytags,
                null_ls.builtins.code_actions.impl,
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.formatting.gofmt,
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })

        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Code Format" })
    end
)
