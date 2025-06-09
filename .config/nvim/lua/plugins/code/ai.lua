return {
    "awhaston/copilot.vim",

    config = function()
        --vim.g.copilot_settings = { selectedCompletionModel = 'claude' }
        vim.g.copilot_filetypes = {
            ['*'] = false,
            ['html'] = true,
            ['javascript'] = true,
            ['typescript'] = true,
            ['python'] = true,
            ['lua'] = true,
            ['c'] = true,
            ['cpp'] = true,
            ['java'] = true,
            ['go'] = true,
            ['rust'] = true,
            ['php'] = true,
        }
    end,
}
