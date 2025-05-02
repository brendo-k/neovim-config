return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        'L3MON4D3/LuaSnip',
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'saadparwaiz1/cmp_luasnip',
        'honza/vim-snippets'
    },

    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        require("luasnip.loaders.from_snipmate").lazy_load()
        require("mason").setup()
        require("mason-lspconfig").setup()

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users
            }, {
                    { name = 'buffer' },
                },
                {
                    { name = 'path' }
                })
        })
        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'cmdline' }
            },
            matching = { disallow_symbol_nonprefix_matching = false }
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- Mason auto load lsp servers
        require("mason-lspconfig").setup_handlers {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function (server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup {
                    capabilities = capabilities
                }
            end,
        }

        vim.api.nvim_create_autocmd("CursorHold", {
            callback = function()
                vim.diagnostic.open_float(nil, { focus = false })
            end
        })
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, { noremap = true, silent = true })
        vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, { noremap = true, silent = true })
        vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { noremap = true, silent = true })

    end
}
