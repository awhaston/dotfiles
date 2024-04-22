local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Hightlight text on yank
autocmd("TextYankPost", {
    group = augroup("HighlightYank", {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
    end,
})

-- Fix conceallevel for json files
autocmd({ "FileType" }, {
    group = augroup("json_conceal", {}),
    pattern = { "json", "jsonc", "json5" },
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
autocmd({ "BufWritePre" }, {
    group = augroup("auto_create_dir", {}),
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- close some filetypes with <q>
autocmd("FileType", {
    group = augroup("close_with_q", {}),
    pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "notify",
        "qf",
        "query",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
    group = augroup("resize_splits", {}),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- Reload config on save
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "**/*config/nvim/lua/*.lua",
    callback = function()
        local filepath = vim.fn.expand("%")

        dofile(filepath)
        vim.notify("Configuration reloaded \n" .. filepath, nil)
    end,
    group = augroup("reload_config", {}),
    desc = "Reload config on save",
})
