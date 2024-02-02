return { --
-- lsp 
{"folke/neoconf.nvim"}, --
{
    "hrsh7th/nvim-cmp",

    event = "InsertEnter",
    dependencies = {"neovim/nvim-lspconfig","hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path","hrsh7th/cmp-cmdline","saadparwaiz1/cmp_luasnip"},
    config = function()
        -- Set up nvim-cmp.
        local cmp = require 'cmp'

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({
                    select = true
                }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({ --
            {
                name = 'nvim_lsp'
            }, 
            --
            -- {
            --     name = 'path'
            -- }, 
            -- {
            --     name = 'vsnip'
            -- } -- For vsnip users.
            {
                name = 'luasnip'
            } -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
            }, {{
                name = 'buffer'
            }})
        })

        -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({{
                name = 'git'
            } -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
            }, {{
                name = 'buffer'
            }})
        })

        cmp.setup.cmdline({'/', '?'}, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {{
                name = 'buffer'
            }}
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({{
                name = 'path'
            }}, {{
                name = 'cmdline'
            }})
        })

    end
}, --
{
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { --
    {"rafamadriz/friendly-snippets"} --
    }, --
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
    end
}, {'williamboman/mason-lspconfig.nvim'}, --
{
    "neovim/nvim-lspconfig",
    opts = {
        setup = {"gopls"}
    },
    config = function(_, opts)
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        for k, v in pairs(opts.setup) do
            require("lspconfig")[v].setup({
                capabilities = capabilities
            })
        end
    end
}, --
{
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
        require("mason").setup({})
    end
} --
}
