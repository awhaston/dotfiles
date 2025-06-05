local opt = vim.opt

-- Line numbers
opt.nu = true
opt.relativenumber = true

-- Search
opt.inccommand = "split"
opt.hlsearch = false
opt.incsearch = true

-- Tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Scrolling
opt.sidescrolloff = 16
opt.scrolloff = 16
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50
