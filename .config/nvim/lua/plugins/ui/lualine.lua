return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        options = {
            theme = 'onedark'
        }
        require('lualine').setup(options)
    end
}
