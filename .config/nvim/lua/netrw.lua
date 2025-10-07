-- Open netrw in current file's directory with "-"
vim.keymap.set('n', '-', function()
    local path = vim.fn.expand('%:p:h') -- current file's directory
    if path == '' then
        path = vim.loop.cwd()           -- fallback to current working directory
    end
    vim.cmd('Explore ' .. path)
end, { noremap = true, silent = true, desc = "Open netrw in current directory" })
