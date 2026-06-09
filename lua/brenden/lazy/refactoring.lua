return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "lewis6991/async.nvim",
    },
    config = function()
        local refactoring = require("refactoring")

        refactoring.setup({})
        local keymap = vim.keymap

        keymap.set({ "n", "x" }, "<leader>re", function()
            return require("refactoring").extract_func()
        end, { desc = "Extract Function", expr = true })
        -- `_` is the default textobject for "current line"
        keymap.set({ "n", "x" }, "<leader>rv", function()
            return require("refactoring").extract_var()
        end, { desc = "Extract Variable", expr = true })
    end
}
