-- set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- open file system
vim.keymap.set("n", "<leader>fs", vim.cmd.Ex)

--nicer way to move
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- nicer way to parse through search terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- move between panes keyampping
vim.keymap.set('n', '<leader>l', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>k', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>j', '<C-w>j', { noremap = true, silent = true })

-- copy and paste keymaps
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>p", [["+p]])

-- open neovim rc directory
vim.keymap.set("n", "<leader>rc", "<Cmd>e ~/.config/nvim/<Cr>")

