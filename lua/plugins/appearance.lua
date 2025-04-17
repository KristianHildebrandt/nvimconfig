return {
        'navarasu/onedark.nvim',
        config = function()
          require('onedark').setup {
            style = 'warmer', -- Options: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
          }
          require('onedark').load()
          vim.opt.termguicolors = true
          vim.opt.guifont = "Monaco:h13"
        end,
      }
