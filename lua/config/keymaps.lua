-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "<A-Down>", ":m+1<cr>")
vim.keymap.set("n", "<A-Up>", ":m-2<cr>")
vim.keymap.set("o", "H", "^")
vim.keymap.set("o", "L", "$")
vim.keymap.set("v", "H", "^")
vim.keymap.set("v", "L", "$")
vim.keymap.set('v', 'Y', '<Plug>OSCYankVisual')

-- local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>k", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<leader>j", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map({ "v", "n", "s" }, "<leader>w", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<leader>i", "<cmd>lua require('swenv.api').pick_venv()<cr>", { desc = "Choose Env" })
map("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { desc = "Peek definitions" })
map("n", "<leader>q", "<cmd>confirm q<CR>", { desc = "Quit" })
map("n", "<leader>l", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
