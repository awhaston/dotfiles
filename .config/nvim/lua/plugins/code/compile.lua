return {
    "awhaston/compile-mode.nvim",
    version = "latest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- if you want to enable coloring of ANSI escape codes in
        -- compilation output, add:
    },
    config = function()
        vim.g.compile_mode = {
            input_word_completion = true,
            focus_compilation_buffer = true,
        }

        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function(args)
                local name = vim.api.nvim_buf_get_name(args.buf)
                if not name:match("%*compilation%*") then return end

                local opts = { buffer = args.buf, silent = true, nowait = true }

                vim.keymap.set("n", "[", "<cmd>PrevError<CR>", opts)
                vim.keymap.set("n", "]", "<cmd>NextError<CR>", opts)
            end,
        })

        vim.keymap.set("n", "<leader>cc", ":Compile<CR>", { desc = "Fullscreen windows" })
    end
}
