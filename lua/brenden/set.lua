vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- when vertical splitting split to the right
vim.opt.splitright = true

-- dont warp lines
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

-- undo files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.wo.relativenumber = true


