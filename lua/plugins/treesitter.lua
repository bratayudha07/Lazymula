return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",

    init = function()
      vim.opt.foldmethod = "manual"
      vim.opt.foldenable = false
      vim.env.CC = "clang"
      vim.env.CXX = "clang++"
    end,

    config = function(_, opts)
      local ok, ts = pcall(require, "nvim-treesitter")
      if not ok then
        vim.notify("nvim-treesitter belum terinstall", vim.log.levels.WARN)
        return
      end
      ts.setup(opts)
    end,

    opts = {
      ensure_installed = {
        "bash", "html", "javascript", "json", "lua", "markdown",
        "markdown_inline", "python", "query", "regex", "tsx",
        "typescript", "vim", "vimdoc", "yaml", "c", "cpp",
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}