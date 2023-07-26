return {
  "folke/which-key.nvim",
  opts = {
    window = {
      border = "single",
    },
    defaults = {
      ["<leader>l"] = { name = "+LSP" },
    }
  },
  -- config = function(_, opts)
  --   local wk = require("which-key")
  --   wk.setup(opts)
  --   wk.register(opts.defaults)
  -- end,
}
