return {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    enabled = false,
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
    },
    keys = {
        { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },

    config = function()
        -- Enables Lazygit tmux session
        vim.keymap.set(
            "n",
            "<leader>gg",
            "<cmd>!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>",
            { desc = "Git Go" }
        )

        -- Tmux toggle horzontal pane
        vim.keymap.set("n", "<leader>th", "<cmd>!tmux split-window -l 15<CR><CR>", { desc = "Tmux Split Horizontal" })

        -- Tmux zoom
        vim.keymap.set("n", "<leader>tf", "<cmd>!tmux resize-pane -Z<CR><CR>", { desc = "Tmux Zoom Pane" })
    end,
}
