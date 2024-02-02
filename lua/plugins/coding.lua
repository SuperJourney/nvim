return {{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim" -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = false
        })
        vim.cmd([[nnoremap \ :Neotree toggle<cr>]])
    end
}, --  
{
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
}, --
{
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({})
        vim.keymap.set("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", {
            silent = true
        })

        vim.keymap.set("n", "<C-E>", "<cmd>lua require('fzf-lua').buffers()<CR>", {
            silent = true
        })

        vim.keymap.set("n", "<C-F>", "<cmd>lua require('fzf-lua').grep()<CR>", {
            silent = true
        })
    end
} --
}
