package.path = package.path .. ";" .. "~/.config/nvim/lua"


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct


local lsp = require("plugins.lsp.init")
local coding = require("plugins.coding")
require("lazy").setup({coding,lsp})

require("plugins.lsp.keymaps")



