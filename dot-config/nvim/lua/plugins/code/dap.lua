-- TODO get Dap working
return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim",
        },
        enabled = false,
        config = function()
            local dap = require("dap")
            local ui = require("dapui")

            require("dapui").setup()

            -- Handled by nvim-dap-go
            -- dap.adapters.go = {
            --   type = "server",
            --   port = "${port}",
            --   executable = {
            --     command = "dlv",
            --     args = { "dap", "-l", "127.0.0.1:${port}" },
            --   },
            -- }

            vim.keymap.set("n", "<space>db", dap.toggle_breakpoint, { desc = "Debug Breakpoint" })

            -- Eval var under cursor
            vim.keymap.set("n", "<space>?", function()
                require("dapui").eval(nil, { enter = true })
            end, { desc = "Debug Evaluate" })

            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug Continue" })
            vim.keymap.set("n", "<leader>dsi", dap.step_into, { desc = "Debug Step Into" })
            vim.keymap.set("n", "<leader>dso", dap.step_over, { desc = "Debug Step Over" })
            vim.keymap.set("n", "<leader>dsO", dap.step_out, { desc = "Debug Step Out" })
            vim.keymap.set("n", "<leader>dsb", dap.step_back, { desc = "Debug Step Back" })
            vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Debug Restart" })
            vim.keymap.set("n", "<leader>de", dap.close, { desc = "Debug Exit" })

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
        end,
    },
}
