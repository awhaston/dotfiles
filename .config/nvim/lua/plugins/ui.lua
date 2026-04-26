add_plugin(
    { src = "awhaston/nvim-treesitter", version = "main" },
    {},
    function()
        local ts = require("nvim-treesitter")
        ts.setup({
            install_dir = vim.fn.stdpath('data') .. '/site'
        })
        local ensure_installed = {
            "lua",
            "javascript",
            "bash",
            "html",
            "json",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "tsx",
            "typescript",
            "vim",
            "yaml",
            "go",
            "gomod",
            "gosum",
            "gotmpl",
            "gowork",
            "css",
        }

        ts.install(ensure_installed)

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { '<filetype>' },
            callback = function()
                vim.treesitter.start()
                vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                vim.wo[0][0].foldmethod = 'expr'
            end,
        })
    end
)

add_plugin(
    { src = "awhaston/telescope.nvim" },
    { deps = { src = "awhaston/plenary.nvim" } },
    function()
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")

        require("telescope").setup({
            defaults = {
                mappings = {
                    n = {
                        ["q"] = actions.close,
                    },
                },
            },
        })

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
        vim.keymap.set("n", "<leader><leader>", function(args)
            builtin.buffers()
            vim.api.nvim_input("<esc>")
        end, { desc = "Find Buffers" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find Grep" })
        vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Find References" })
        vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { desc = "Find Implementations" })
        vim.keymap.set("n", "<leader>ft", builtin.lsp_type_definitions, { desc = "Find Type Definitions" })
        vim.keymap.set(
            "n",
            "<leader>fd",
            ":lua require('telescope.builtin').diagnostics({bufnr = 0}) <CR>",
            { desc = "Find Diagnostics Current Buffer" }
        )
        vim.keymap.set("n", "<leader>fD", builtin.diagnostics, { desc = "Find Diagnostics Project" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })

        function FindFiles(opts)
            dir = opts.args

            builtin.find_files({ search_dirs = { dir } })
        end

        function FindGrep(opts)
            dir = opts.args

            builtin.live_grep({ search_dirs = { dir } })
        end

        vim.api.nvim_create_user_command("FindFiles", function(opts)
            FindFiles(opts)
        end, { nargs = 1, desc = "Find files in a directory" })

        vim.api.nvim_create_user_command("FindGrep", function(opts)
            FindGrep(opts)
        end, { nargs = 1, desc = "Grep in a directory" })
    end
)

add_plugin(
    { src = "awhaston/oil.nvim", version = "master" },
    {
        deps = { src = "awhaston/nvim-web-devicons" },
    },
    function()
        require("oil").setup({
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
            },
            view_options = {
                show_hidden = true,
            }
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
)

add_plugin(
    { src = 'awhaston/lualine.nvim' },
    {
        deps = { src = 'awhaston/nvim-web-devicons' }
    },
    function()
        options = {
            theme = 'onedark'
        }
        require('lualine').setup(options)
    end
)

add_plugin(
    { src = "awhaston/gitsigns.nvim" },
    {},
    function()
        require("gitsigns").setup({
            numhl = true,
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        })
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- Make side columns bigger if using gitsigns
        vim.opt.signcolumn = "yes:2"

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>gp", gs.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>gd", gs.diffthis, "Diff This")
        map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
    end
)

add_plugin(
    { src = "awhaston/rasmus.nvim", name = "rasmus" },
    {},
    function()
        vim.cmd([[colorscheme rasmus]])
        vim.opt.termguicolors = true
    end
)

add_plugin(
    { src = "awhaston/bufferline.nvim", version = "main" },
    {
        deps = { src = "awhaston/nvim-web-devicons" }
    },
    function()
        map = vim.keymap.set
        require("bufferline").setup({
            options = { -- stylua: ignore
                diagnostics = "nvim_lsp",
                always_show_bufferline = false,
            },
        })

        map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin" })
        map("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Delete Non-Pinned Buffers" })
        map("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Delete Other Buffers" })
        map("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "Delete Buffers to the Right" })
        map("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Delete Buffers to the Left" })
        map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
        map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })

        -- Fix bufferline when restoring a session
        vim.api.nvim_create_autocmd("BufAdd", {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end,
        })
    end
)

add_plugin(
    { src = "awhaston/which-key.nvim" },
    {},
    function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup({})
    end
)
