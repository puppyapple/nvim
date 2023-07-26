local pyright_opts = {
  root_dir = function(fname)
    local util = require("lspconfig.util")
    local root_files = {
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      "Pipfile",
      "manage.py",
      "pyrightconfig.json",
    }
    return util.root_pattern(unpack(root_files))(fname) or util.root_pattern(".git")(fname) or util.path.dirname(fname)
  end,
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        reportGeneralTypeIssues = true,
      },
    },
  },
  single_file_support = true,
}
return -- LSP keymaps
{
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    keys[#keys + 1] = { "<leader>cA", false }
    keys[#keys + 1] = { "gr", false }
    keys[#keys + 1] = { "gd", false }
    keys[#keys + 1] = { "<leader>cd", false }
    keys[#keys + 1] = { "<leader>cf", false }
    keys[#keys + 1] = { "<leader>cl", false }
    keys[#keys + 1] = { "<leader>cr", false }
    keys[#keys + 1] = {
      "<leader>la",
      vim.lsp.buf.code_action,
      desc = "Code Action",
      mode = { "n", "v" },
      has = "codeAction"
    }
    keys[#keys + 1] = { "<leader>ca", false }
    keys[#keys + 1] = { "<leader>lr", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
  end,
  opts = {
    servers = {
      pyright = pyright_opts,
      ruff_lsp = {},
    },
    setup = {
    },
  },
}
