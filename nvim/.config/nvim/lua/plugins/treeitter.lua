return {
  "nvim-treesitter/nvim-treesitter",
  dependencies ={
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  main = "nvim-treesitter.configs",
  bulid = ':TSUpdate',
  opts = {
    ensure_installed = 'all',
    highlight = {enable = true},
    indent = {enabele = true},
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      selection_modes = {
        ['@parameter.outer'] = 'v',
        ['@function.outer'] = 'V',
        ['@class.outer'] = '<c-v>',
      },
      include_surrounding_whitespace = false,
    },
  },
  }
}
