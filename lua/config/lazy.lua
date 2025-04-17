local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
g.mapleader = ","  -- Leader key to comma
g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },

  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
-- General Settings
opt.number = true  -- Show line numbers
opt.backspace = { 'indent', 'eol', 'start' }  -- Allow backspace in insert mode
opt.history = 1000  -- Store lots of :cmdline history
opt.showcmd = true  -- Show incomplete commands at the bottom
opt.showmode = true  -- Show current mode at the bottom
opt.visualbell = true  -- No sounds
opt.compatible = false  -- Better save than sorry
opt.mouse = 'a'  -- Mouse support
opt.clipboard:append('unnamed')  -- Clipboard support
opt.cursorline = true  -- Highlight current line

-- Display trailing spaces
opt.listchars = { tab = '>-', trail = '.' }
opt.list = true  -- Show trailing spaces and tabs

-- Background buffers
opt.hidden = true  -- Allow buffers to exist in the background

-- Search Settings
opt.incsearch = true  -- Find the next match as we type
opt.hlsearch = true  -- Highlight searches by default
opt.viminfo = "'100,f1"  -- Save up to 100 marks, enable capital marks

-- Swap files and backups
opt.swapfile = false  -- Turn off swap files
opt.backup = false  -- Turn off backup files
opt.writebackup = false  -- Turn off backup while writing

-- Persistent Undo
vim.fn.system({ 'mkdir', '-p', vim.fn.expand('~/.vim/backups') })  -- Ensure backup directory exists
opt.undodir = vim.fn.expand('~/.vim/backups')  -- Set undo directory
opt.undofile = true  -- Keep undo history across sessions

-- Indentation
opt.autoindent = true  -- Auto indent new lines
opt.smartindent = true  -- Smart indenting
opt.cindent = true  -- C-style indentation
opt.smarttab = true  -- Smart tabbing
opt.shiftwidth = 2  -- Number of spaces to use for each step of (auto)indent
opt.softtabstop = 2  -- Number of spaces a tab counts for in insert mode
opt.tabstop = 2  -- Number of spaces a tab counts for
opt.expandtab = true  -- Convert tabs to spaces

-- Filetype settings
cmd('filetype on')
cmd('filetype plugin on')
cmd('filetype indent on')

-- Line wrapping
opt.wrap = true  -- Don't wrap lines
opt.linebreak = true  -- Wrap lines at convenient points

-- Folds
opt.foldmethod = 'indent'  -- Fold based on indent
opt.foldnestmax = 10  -- Deepest fold is 10 levels
opt.foldenable = false  -- Don't fold by default

-- Scrolling
opt.scrolloff = 8  -- Start scrolling when 8 lines away from margins
opt.sidescrolloff = 15
opt.sidescroll = 1

-- Strip trailing spaces on save
autocmd('BufWritePre', {
  pattern = '*',
  command = ':%s/\\s\\+$//e',
})

-- Paste multiple times in visual mode
vim.api.nvim_set_keymap('x', 'p', 'pgvy', { noremap = true, silent = true })
