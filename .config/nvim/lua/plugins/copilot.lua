return {
  "zbirenbaum/copilot.lua",
  enable = false,
  cmd = "Copilot",
  build = ":Copilot auth",
  config = function()
    require("copilot").setup {
      suggestion = { enabled = false }, -- ghost text 無効化
      panel = { enabled = false },
    }
  end,
}
