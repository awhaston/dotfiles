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

    cmd = string.format("prettier --config \"%s\" \"%s\" --write", prettier_config, current_file)

    exit_message = vim.fn.system(cmd)

    if vim.v.shell_error ~= 0 then
        print("There was an error running prettier", exit_message)
    else
        -- Reload to see changes (Can be undone)
        vim.cmd("edit!")
    end
end, { nargs = "*", desc = "Run Prettier on the current file" })

local oct2bin = {
    ['0'] = '000',
    ['1'] = '001',
    ['2'] = '010',
    ['3'] = '011',
    ['4'] = '100',
    ['5'] = '101',
    ['6'] = '110',
    ['7'] = '111'
}
local function getOct2bin(a) return oct2bin[a] end
local function convertBin(n)
    local s = string.format('%o', n)
    s = s:gsub('.', getOct2bin)
    return s
end

vim.api.nvim_create_user_command("Hex2Bin", function(args)
    --create lookup table for octal to binary

    local hex = args.fargs[1]
    if not hex then
        print("Please provide a hex value")
        return
    end

    print("Binary value: " .. convertBin(tonumber(hex, 16)))
end, { nargs = 1, desc = "Convert hex to binary" })

vim.api.nvim_create_user_command("Hex2Dec", function(args)
    local hex = args.fargs[1]
    if not hex then
        print("Please provide a hex value")
        return
    end

    local dec = tonumber(hex, 16)
    print("Decimal value: " .. dec)
end, { nargs = 1, desc = "Convert hex to decimal" })

vim.api.nvim_create_user_command("Dec2Bin", function(args)
    local dec = args.fargs[1]
    if not dec then
        print("Please provide a decimal value")
        return
    end

    print("Binary value " .. convertBin(tonumber(dec)))
end, { nargs = 1, desc = "Convert decimal to binary" })

-- Function to add % to the end of visually selected lines
local function add_percent_to_selected_lines()
    -- Get the start and end of visual selection
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")

    -- Get all the lines in the selection
    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

    -- Add % to the end of each line
    for i, line in ipairs(lines) do
        if line ~= "" and line:sub(-1) ~= "%" then
            lines[i] = line .. "%"
        end
    end

    -- Replace the lines in the buffer
    vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, lines)
end

-- Create the user command
vim.api.nvim_create_user_command('LatexComment', add_percent_to_selected_lines, {
    range = true,
    desc = 'Add % to the end of all selected lines'
})
