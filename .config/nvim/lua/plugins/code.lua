add_plugin({ src = "awhaston/copilot.vim" },
    {},
    function()
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
            ['sql'] = true,
        }

        -- Start with copilot disabled
        vim.g.copilot_enabled = false
    end
)

add_plugin(
    { src = "awhaston/compile-mode.nvim", version = "main" },
    { deps = { src = "nvim-lua/plenary.nvim" } },
    function()
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

        vim.keymap.set("n", "<leader>cc", ":Compile<CR>", { desc = "Compile mode" })
    end
)

add_plugin(
    { src = "awhaston/mini.pairs" },
    {},
    function()
        require("mini.pairs").setup()
    end
)
