return {
  "zbirenbaum/copilot.lua",
  opts = {
    panel = {
      enabled = false,
      auto_refresh = true,
      keymap = {
        jump_prev = "[c",
        jump_next = "]c",
        accept = "<C-i>",
        refresh = "gc",
        open = "<C-c>"
      }
    },
    filetypes = {
      python = true
    },
    suggestions = {
      enabled = false,
      auto_trigger = true,
    },
  },
}
