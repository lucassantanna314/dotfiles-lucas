return {
  -- 1. Configura o plugin do Catppuccin com transparência
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true, -- Aqui é onde a mágica acontece para o Kitty
      integrations = {
        neotree = true, -- Deixa a árvore de arquivos transparente também
        treesitter = true,
        notify = true,
        mini = true,
      },
    },
  },

  -- 2. Diz ao LazyVim para usar o Catppuccin como tema padrão
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
