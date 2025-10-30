return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({
        check_ts = true, -- use Treesitter to avoid pairing in comments/strings when appropriate
        fast_wrap = {},  -- enable <A-e> to fast wrap the word under cursor
      })

      -- Integrate with nvim-cmp: add parentheses after confirming function/method items
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
