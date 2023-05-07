local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})


lsp.ensure_installed({
    'tsserver',
    'emmet_ls',
    'html',
    'csslsp',
    'cssmodule_ls',
    'prettier'
})

lsp.configure('tsserver', {
    on_attach = function(client, bufnr)
        print('hello tsserver')
    end,
    settings = {
        completions = {
            completeFunctionCalls = true
        }
    }
})

-- (Optional) Configure lua language server for neovim
lsp.setup()
