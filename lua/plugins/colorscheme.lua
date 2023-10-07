local util = require("tokyonight.util")
return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "dark",          -- style for floating windows
      },
      on_colors = function(colors)
        colors.border = "#565f89"
      end,
      on_highlights = function(hl, c)
        hl.Hlargs = { fg = "#D49DA5" }
        hl.DiagnosticVirtualTextHint = { bg = util.darken(c.magenta, 0.1), fg = c.magenta }
        hl.DiagnosticVirtualTextError = { bg = util.darken("#ff0000", 0.1), fg = "#ff0000" }
        hl.Error = { fg = "#ff0000" }
        hl["@string.documentation"] = { fg = "#278505" }
        hl["@comment"] = { fg = "#278505" }
        hl["@function"] = { fg = "#2c56ff" }
        hl["@constructor"] = { fg = c.yellow, bold = true }
        hl["@parameter"] = { fg = "#fc589a", style = { italic = true } }
        hl["@field"] = { fg = "#10deb5" }
        hl["@variable"] = { fg = "#7b64ff" }
        hl["@type"] = { fg = "#fa0265" }
        hl["@type.builtin"] = { fg = c.yellow }
        hl["@constant.builtin"] = { fg = c.yellow }
        hl["@keyword"] = { fg = "#d56ee0", style = { italic = true } }
        hl["@keyword.operator"] = { fg = "#d56ee0", style = { italic = true } }
        hl["@keyword.return"] = { fg = "#d56ee0", style = { italic = true } }
        hl["@method.call"] = { fg = "#3497d0", style = { italic = true } }
        hl["@repeat"] = { style = { fg = c.cyan, italic = true } }
        hl["@include"] = { style = { fg = c.cyan, italic = true } }
        hl["@conditional"] = { style = { fg = "#d56ee0", italic = true } }
        hl["@variable.builtin"] = { fg = "#e5c07b" }
        hl["@property"] = { fg = "red", style = { italic = true } }
        hl["@local.definition"] = { fg = "red", style = { italic = true } }
      end,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
