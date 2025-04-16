return {
    'mfussenegger/nvim-dap-python',
    dependencies = {
        'mfussenegger/nvim-dap',
        'theHamsta/nvim-dap-virtual-text',
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local ui = require "dapui"
        local dap = require 'dap'

        require("dapui").setup()
        require('dap-python').setup('~/miniconda3/envs/debugpy/bin/python')
        require("nvim-dap-virtual-text").setup()

        -- Eval var under cursor
        vim.keymap.set("n", "<space>?", function()
            require("dapui").eval(nil, { enter = true })
        end)

        vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
        vim.keymap.set("n", "<space>gd", dap.run_to_cursor)

        -- Eval var under cursor
        vim.keymap.set("n", "<space>?", function()
            require("dapui").eval(nil, { enter = true })
        end)

        vim.keymap.set("n", "<F1>", dap.continue)
        vim.keymap.set("n", "<F2>", dap.step_into)
        vim.keymap.set("n", "<F3>", dap.step_over)
        vim.keymap.set("n", "<F4>", dap.step_out)
        vim.keymap.set("n", "<F5>", dap.step_back)
        vim.keymap.set("n", "<F8>", dap.restart)
        vim.keymap.set("n", "<F12>", dap.terminate)

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

}
