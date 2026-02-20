return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
  },
  init = function()
    -- Fix treesitter fold error di Termux
    vim.opt.foldmethod = "manual"
    vim.opt.foldenable = false
  end,
}
