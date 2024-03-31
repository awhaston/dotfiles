return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                -- Ensure mason installs the server
                omnisharp = {},
            },
            -- configure omnisharp to fix the semantic tokens bug (really annoying)
            setup = {
                omnisharp = function(_, _)
                    require("lazyvim.util").on_attach(function(client, _)
                        if client.name == "omnisharp" then
                            ---@type string[]
                            local tokenModifiers =
                                client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
                            for i, v in ipairs(tokenModifiers) do
                                tokenModifiers[i] = v:gsub(" ", "_")
                            end
                            ---@type string[]
                            local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
                            for i, v in ipairs(tokenTypes) do
                                tokenTypes[i] = v:gsub(" ", "_")
                            end
                        end
                    end)
                    return false
                end,
            },
        },
    },
}
