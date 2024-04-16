local null_ls = require("null-ls")

-- code action sources
local code_actions = null_ls.builtins.code_actions

-- diagnostic sources
-- local diagnostics = null_ls.builtins.diagnosticslocal
local formatting = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local callback = function()
        vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(client)
                return client.name == "null-ls"
            end
        })
    end,


    null_ls.setup({
        sources = {
            null_ls.builtins.code_actions.gitsigns,
            null_ls.builtins.code_actions.xo,
            null_ls.builtins.formatting.prettier
        },
        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
            end
        end,
    })

vim.cmd('map <Leader>f :lua vim.lsp.buf.format(nil, 10000)<CR>')
