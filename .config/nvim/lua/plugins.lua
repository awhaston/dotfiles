local gh = function(x) return 'https://github.com/' .. x end

_G.add_plugin = function(spec, opts, setup)
    if opts.enabled == false then
        return
    end

    if opts.deps ~= nil then
        local deps_list = (opts.deps[1] ~= nil) and opts.deps or { opts.deps }
        for _, dep in ipairs(deps_list) do
            dep.src = gh(dep.src)
        end
        vim.pack.add(deps_list)
    end

    spec["src"] = gh(spec["src"])

    vim.pack.add({ spec })
    setup()
end


vim.api.nvim_create_user_command("UpdatePlugins", function(args) vim.pack.update() end,
    { nargs = 0, desc = "Run Pack Update" })

require("plugins.lsp")
require("plugins.code")
require("plugins.ui")
require("plugins.local")
