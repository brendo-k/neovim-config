vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- when vertical splitting split to the right
vim.opt.splitright = true

-- dont warp lines
vim.opt.wrap = false

-- Don't save these annoying files
vim.opt.swapfile = false
vim.opt.backup = false

-- undo files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- incremental search when seraching 
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- relative line numbers (not sure if I enjoy this yet)
vim.wo.relativenumber = true

-- netrw open dir when pressing <Cr>
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

vim.o.updatetime = 500  -- Reduce delay for update time (default is 4000 ms) (used for CursorHold)

