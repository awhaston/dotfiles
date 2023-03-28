local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

lsp.on_attach(function(client, bufnr)
  lsp.buffer_autoformat()
end)

lsp.ensure_installed({
  'tsserver',
  'emmet_ls',
  'html',
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
