return { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000, 
    config = function()
        -- load the colorscheme here
        vim.cmd([[colorscheme catppuccin]])
        local sign = vim.fn.sign_define

        sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
        sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
        sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
    end,
}

