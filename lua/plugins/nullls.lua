local nls = require("null-ls")
return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = {
    sources = {
      nls.builtins.diagnostics.codespell,
      nls.builtins.formatting.black,
      -- nls.builtins.diagnostics.flake8,
    },
  },
}
