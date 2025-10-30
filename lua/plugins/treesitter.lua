return {
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',  -- Automatically updates the parsers
    config = function()
      require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = {
          "lua","elixir","heex","eex","python","terraform","hcl","yaml","json",
          "bash","markdown","regex","gitcommit","gitignore",
          -- Go
          "go","gomod","gowork",
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        -- List of parsers to ignore installing (or "all")
        ignore_install = { "javascript" },

        highlight = {
          enable = true,

          -- Disable highlighting for certain languages
          disable = { "c", "rust" },

          -- Function to disable highlighting for large files
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return trub
            end
          end,

          -- Run both `:h syntax` and tree-sitter at the same time.
          additional_vim_regex_highlighting = false,
        },
      }
    end
  }
}
