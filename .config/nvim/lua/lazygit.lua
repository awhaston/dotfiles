local buf, win, lastbuf, termopen

local function open_win()
    lastwin = vim.api.nvim_get_current_win()
    if win then
        if termopen == true then
            vim.api.nvim_win_set_option(lastwin, "cursorline", true)
            termopen = false
            return
        else
            vim.api.nvim_win_set_option(win, "cursorline", true)
            termopen = true
        end
    else
        buf = vim.api.nvim_create_buf(false, true)

        vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

        local width = vim.api.nvim_get_option("columns")
        local height = vim.api.nvim_get_option("lines")

        local win_height = math.ceil(height * 0.9 - 4)
        local win_width = math.ceil(width * 0.9)

        local row = math.ceil((height - win_height) / 2 - 1)
        local col = math.ceil((width - win_width) / 2)

        local opts = {
            style = "minimal",
            relative = "editor",
            width = win_width,
            height = win_height,
            row = row,
            col = col,
            border = "rounded",
        }

        win = vim.api.nvim_open_win(buf, true, opts)
        vim.api.nvim_win_set_option(win, "cursorline", true)
        termopen = true
    end
end

local function view()
    vim.api.nvim_buf_set_option(buf, "modifiable", true)
    vim.cmd(":terminal lazygit")
    vim.api.nvim_buf_set_option(0, "modifiable", false)
end

local function swap(buffer)
    vim.api.nvim_buf_set_option(buffer, "modifiable", true)
    vim.api.nvim_buf_set_option(0, "modifiable", false)
end

function open_lazygit()
    lastbuf = vim.api.nvim_get_current_buf()
    if os.execute("which lazygit") == 0 then
        if buf then
            if termopen then
                print(lastbuf)
                swap(lastbuf)
                termopen = false
            else
                swap(buf)
                termopen = true
            end
        else
            lastbuf = vim.api.nvim_get_current_buf()
            open_win()
            view()
            termopen = true
        end
    else
        print("Lazygit not installed")
    end
end
