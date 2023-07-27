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
vim.api.nvim_del_keymap("n", "<leader>l")

local Util = require("lazyvim.util")
local lazyterm = function() Util.float_term(nil, { cwd = Util.get_root() }) end

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
map("n", "<leader>bj", "<cmd>BufferLinePick<cr>", { desc = "Jump to buffer" })
map({ "v", "n", "s" }, "<leader>fs", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<leader>i", "<cmd>lua require('swenv.api').pick_venv()<cr>", { desc = "Choose Env" })
map("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", { desc = "Peek definitions" })
map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Show Line Diagnostics" })
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
map("n", "<c-\\>", lazyterm, { desc = "Terminal (root dir)" })
map("t", "<c-\\>", "<cmd>close<cr>", { desc = "Hide Terminal" })
