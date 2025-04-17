return {
    'preservim/nerdtree',
    config = function()
      -- Make nerdtree look nice
      vim.g.NERDTreeMinimalUI = 1
      vim.g.NERDTreeDirArrows = 1
      vim.g.NERDTreeWinSize = 42
      vim.g.NERDTreeQuitOnOpen = 1
  
      -- Key mappings
      vim.api.nvim_set_keymap('n', 'sn', ':NERDTreeToggle<CR>:NERDTreeMirror<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'sf', ':NERDTreeFind<CR>', { noremap = true, silent = true })
    end
  }