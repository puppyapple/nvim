return {
  "folke/which-key.nvim",
  opts = {
    window = {
      border = "single",
    },
    defaults = {
      ["<leader>l"] = { name = "+LSP" },
      ["<leader>c"] = { name = "+Code" },
    },
  },
  -- config = function(_, opts)
  --   wk.register(opts.defaults)
  -- end,
}
