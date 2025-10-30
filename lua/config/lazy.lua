-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","
vim.o.termguicolors = true
vim.o.updatetime = 200
vim.o.timeoutlen = 400
vim.o.completeopt = "menu,menuone,noselect"
vim.opt.clipboard = "unnamedplus"

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

require("lazy").setup({
  spec = { { import = "plugins" } },
  change_detection = { notify = false },
})

-- Handy Telescope mappings
local map = vim.keymap.set
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
-- Windsurf chat toggle
map("n", "<leader>ac", ":WindsurfChat<CR>", { desc = "AI Chat" })
