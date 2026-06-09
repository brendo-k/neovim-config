 -- set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- open file system
vim.keymap.set("n", "<leader>fs", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fh", function() vim.cmd("Explore ~") end)


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

-- Run current bash file on slurm
local handle = io.popen('hostname')
local hostname = handle:read("*l")
handle:close()
if (hostname:lower():find("cedar") ~= nil) then
	vim.keymap.set("n", "<leader>s", ":w<Cr>:!submit_sbatch.sh <C-R>=expand('%:t')<CR><CR>")
else
	vim.keymap.set("n", "<leader>s", ":w<Cr>:!sbatch %<Cr>")
end

vim.keymap.set("n", "<leader>=", function() vim.cmd("cd " .. vim.b.netrw_curdir) end)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.keymap.set("n", "<leader>y", function()
      local path = vim.fn.expand("<cfile>")
      local fullpath = vim.fn.fnamemodify(path, ":p")
      vim.fn.setreg([["]], fullpath)
      print("Copied to clipboard: " .. fullpath)
    end, { buffer = true })
  end,
})

-- Run current bash file on slurm
vim.keymap.set("n", "<leader>n", vim.cmd.bp)
vim.keymap.set("n", "<leader>m", vim.cmd.bn)

-- Quick fix list
vim.keymap.set("n", "]q", ":cnext<CR>")
vim.keymap.set("n", "[q", ":cprev<CR>")

-- Escape term
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "<Tab><leader>h", [[<C-\><C-n><C-w>h]])
vim.keymap.set("t", "<Tab><leader>j", [[<C-\><C-n><C-w>j]])
vim.keymap.set("t", "<Tab><leader>k", [[<C-\><C-n><C-w>k]])
vim.keymap.set("t", "<Tab><leader>l", [[<C-\><C-n><C-w>l]])
