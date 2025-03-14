return {
    'awhaston/lualine.nvim',
    dependencies = { 'awhaston/nvim-web-devicons' },
    config = function()
        options = {
            theme = 'onedark'
        }
        require('lualine').setup(options)
    end
}
