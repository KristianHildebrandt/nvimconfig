return {
  'numToStr/Comment.nvim',
  opts = {
    -- add plugin-specific options here
    padding = true,
    sticky = true,
    mappings = {
      basic = false,  -- disable default mappings
      extra = false,
    },
  },
  config = function(_, opts)
    require('Comment').setup(opts)

    -- Custom keymaps AFTER the plugin is loaded
    vim.keymap.set("n", "<leader>c<space>", function()
      require("Comment.api").toggle.linewise.current()
    end, { desc = "Toggle comment linewise" })

    vim.keymap.set("n", "<leader>cb<space>", function()
      require("Comment.api").toggle.blockwise.current()
    end, { desc = "Toggle comment linewise" })

    vim.keymap.set("v", "<leader>c<space>", function()
      require("Comment.api").toggle.linewise(vim.fn.visualmode())
    end, { desc = "Toggle comment linewise in visual mode" })

    vim.keymap.set("v", "<leader>cb<space>", function()
      require("Comment.api").toggle.blockwise(vim.fn.visualmode())
    end, { desc = "Toggle comment linewise in visual mode" })
  end
}
