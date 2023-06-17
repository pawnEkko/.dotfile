return {
  { "iamcco/mathjax-support-for-mkdp" },
  {
    "iamcco/markdown-preview.nvim",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    cmd = {
      "MarkdownPreview",
      "MarkdownPreviewStop",
      "MarkdownPreviewToggle",
    },
    event = "BufRead",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      { "<leader>mm", "<cmd>MarkdownPreview<cr>", desc = "MarkdownPreview" },
    },
  },
}
