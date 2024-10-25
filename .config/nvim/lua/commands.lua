function ProseMode()
    vim.cmd(":set wrap!")
end

vim.api.nvim_create_user_command("Prose", ":lua ProseMode()", { desc = "Enable prose mode" })
