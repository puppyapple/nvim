return -- LSP keymaps
{
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    keys[#keys + 1] = { "gr", "<cmd>Trouble lsp_references<cr>", "Go to references(Trouble)" }
    keys[#keys + 1] = { "gd", "<cmd>Trouble lsp_definitions<cr>", "Go to definitions(Trouble)" }
    -- disable a keymap
    -- keys[#keys + 1] = { "K", false }
    -- add a keymap
    -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
  end,
}
