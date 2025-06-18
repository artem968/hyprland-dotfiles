-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable arrow keys in Normal mode
vim.keymap.set("n", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Right>", "<Nop>", { noremap = true, silent = true })

-- Disable arrow keys in Visual mode
vim.keymap.set("x", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("x", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("x", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("x", "<Right>", "<Nop>", { noremap = true, silent = true })

-- Disable arrow keys in Insert mode
vim.keymap.set("i", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<Right>", "<Nop>", { noremap = true, silent = true })

-- Disable arrow keys in Command-line mode
vim.keymap.set("c", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("c", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("c", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("c", "<Right>", "<Nop>", { noremap = true, silent = true })

-- Disable arrow keys in Operator-pending mode
vim.keymap.set("o", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("o", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("o", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("o", "<Right>", "<Nop>", { noremap = true, silent = true })
