return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    window = {
      width = 0.85, -- Largura da janela centralizada (85%)
      options = {
        number = false, -- Esconde números de linha
        relativenumber = false, -- Esconde números relativos
      },
    },
    plugins = {
      gitsigns = { enabled = false }, -- Esconde colunas do git
      tmux = { enabled = false }, -- Se usar tmux, pode desabilitar
    },
  },
  keys = {
    { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
  },
}
