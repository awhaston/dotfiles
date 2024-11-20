function ProseMode(args)
    vim.cmd(":set wrap!")
end

vim.api.nvim_create_user_command("Prose", ProseMode, { desc = "Enable prose mode" })

custom_prettier_config = nil

vim.api.nvim_create_user_command("SetPrettierConfig", function(args)
    custom_prettier_config = args.fargs[1]
end, { nargs = 1, desc = "Set a custom Prettier config filename for the session" })

vim.api.nvim_create_user_command("Prettier", function(args)
    local root_patterns = { ".git", "package.json" }
    local prettier_filename = ".prettierrc"
    local current_file = vim.fn.expand('%:p')
    local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])

    -- Set by SetPrettierConfig command
    if custom_prettier_config then
        prettier_filename = custom_prettier_config
    end

    local prettier_config = vim.fs.find(vim.fs.joinpath(root_dir, prettier_filename), { upward = true })[1]
    -- If we could not find a project prettier file set it to the default one included in dotfiles
    if not prettier_config then
        prettier_config = vim.fs.joinpath(vim.fn.stdpath("config"), "prettier.json")
    end

    exit_message = vim.fn.system(string.format("prettier --config %s %s --write", prettier_config,
        current_file))

    if vim.v.shell_error ~= 0 then
        print("There was an error running prettier", exit_message)
    else
        -- Reload to see changes (Can be undone)
        vim.cmd("edit!")
    end
end, { nargs = "*", desc = "Run Prettier on the current file" })
