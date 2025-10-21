return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- "zbirenbaum/copilot-cmp", -- Copilot補完 source
    "hrsh7th/cmp-nvim-lsp", -- LSP補完 source
    "hrsh7th/cmp-buffer", -- バッファ補完
    "hrsh7th/cmp-path", -- パス補完
    "L3MON4D3/LuaSnip", -- スニペット対応（必要に応じて）
  },
  config = function()
    local cmp = require "cmp"
    cmp.setup {
      snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
      },
      mapping = cmp.mapping.preset.insert {
        ["<Tab>"] = cmp.mapping.confirm { select = true },
        ["<C-Space>"] = cmp.mapping.complete(),
      },
      sources = cmp.config.sources {
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      },
    }
  end,
}
