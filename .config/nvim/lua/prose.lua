local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

function ProseMode(args)
    vim.cmd(":set wrap!")
end

vim.api.nvim_create_user_command("Prose", ProseMode, { desc = "Enable prose mode" })

autocmd({ "BufEnter", "BufLeave", }, {
    pattern = { "*.md" },
    group = augroup("md_files", {}),
    command = "Prose",
    desc = "Enter Prose Mode for any md files"
})
